package com.nadeuli.mypage.service;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nadeuli.common.object.service.ObjectStorageService;
import com.nadeuli.mypage.dao.MyCalendarDAO;
import com.nadeuli.mypage.dao.MypageDAO;
import com.nadeuli.mypage.dto.CalDTO;
import com.nadeuli.mypage.dto.MemberDTO;
import com.nadeuli.review.bean.ReviewDTO;
import com.nadeuli.review.bean.ReviewPagingDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class MyPage implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;
	@Autowired
    private ReviewPagingDTO reviewPagingDTO;
	
	@Autowired
	private ObjectStorageService objectStorageService;
	private String bucketName = "miniproject";
	
	
	
	@Override
	public void update(MemberDTO memberDTO) {
		mypageDAO.memberUpdate(memberDTO);
	}
	
	@Override
	public HashMap<String, Object> getUser(String memId) {
		MemberDTO memberDTO = mypageDAO.getUser(memId);
		
		JSONObject jsonObj = new JSONObject();
        HashMap<String, Object> hash = new HashMap<>();
        
        Object member_id= memberDTO.getMem_id();
        Object member_name=memberDTO.getMem_name();
        Object member_phone=memberDTO.getMem_phone();
        Object member_email=memberDTO.getMem_email();
        Object member_gender=memberDTO.getMem_gender();
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일'T'HH:mm:ss.SSSXXX");
        String tempDate = sdf.format(memberDTO.getMem_joinDate()); // Object 대신 String 사용
        String[] member_joinDate = tempDate.split("T"); // 'T'로 날짜와 시간 분리   
        
        hash.put("mem_id", member_id);
        hash.put("mem_name", member_name);
        hash.put("mem_phone", member_phone);
        hash.put("mem_email", member_email);
        hash.put("mem_gender", member_gender);
        hash.put("mem_joinDate", member_joinDate[0]);
        
        return hash;
	}
	
	@Override
	public MemberDTO getUserDTO(String memId) {
		MemberDTO memberDTO = mypageDAO.getUser(memId);
		return memberDTO;
	}
	@Override
	public List<Map<String, Object>> getSchedule(Map<String, Object> map) {
		String selectedDate = map.get("selectedDate").toString();
		map.put("selectStart", selectedDate+ " 23:59:59");
	    map.put("selectEnd", selectedDate+ " 00:00:01");
		List<CalDTO> listAll = mypageDAO.getSchedule(map);
		
		JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
        
        HashMap<String, Object> hash = new HashMap<>();
        //System.out.println(listAll.size());
        for (int i = 0; i < listAll.size(); i++) {
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
        	Object start=sdf.format(listAll.get(i).getCal_startDate()); 
        	Object end=sdf.format(listAll.get(i).getCal_endDate()); 
            hash.put("title", listAll.get(i).getCal_title());
            hash.put("start", start);
            hash.put("end", end);
            hash.put("description",listAll.get(i).getCal_memo() );
            hash.put("color", listAll.get(i).getCal_color());
            jsonObj = JSONObject.fromObject(hash);;
            jsonArr.add(jsonObj);
        }
        
        return jsonArr;
	}//getSchedule
	
	@Override
	public void setProfileImg(MemberDTO memberDTO
								,HttpSession httpSession
								,MultipartFile img) {
		//실제폴더
    	//D:/Spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/miniproject/resources/mypage/storage
    	String filePath = httpSession.getServletContext().getRealPath("resources/mypage/storage");
    	//System.out.println("실제폴더 = " + filePath);
    	
    	//ncp에 업로드. UUID 저장.
    	String imageFileName = null;
    	imageFileName = objectStorageService.uploadFile(bucketName, "storage/profile/", img );
    	memberDTO.setMem_profileImage(imageFileName);	
    	
    	File file = new File(filePath, imageFileName);
    	try {
			img.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    	//MySQL에 파일 이름 저장
		mypageDAO.setProfileImg(memberDTO);
	}
	
	@Override
	public void deleteProfile(MemberDTO memberDTO) {
		//NCP 삭제
		String imageFileName= memberDTO.getMem_profileImage();
		objectStorageService.deleteFile(bucketName,"storage/profile/"+imageFileName);
		//System.out.println("ncp 삭제");
		
		//MySQL 삭제
		mypageDAO.deleteFile(memberDTO);
	}
	
	@Override
	public Map<String, Object> getMyBoardList(String pg, String id) {
		//1페이지당 3개씩 - MySQL
        int startNum = Integer.parseInt(pg) * 6 - 6; //시작위치는 0부터
        
        Map<String, Object> tempMap = new HashMap<String, Object>();
        tempMap.put("startNum", startNum);
        tempMap.put("mem_id", id);
        //List객체가 JSON으로 자동 변환된다. - pom.xml <dependency>에 추가해야 함
        //System.out.println(tempMap.get("mem_id")+", "+tempMap.get("startNum"));
        List<ReviewDTO> list = mypageDAO.getMyBoardList(tempMap);
        for(int i=0; i<list.size(); i++)
        	list.get(i).setMEM_ID(id);
        //페이징 처리
        int totalA = mypageDAO.getTotalA(id); //총글수

        reviewPagingDTO.setCurrentPage(Integer.parseInt(pg));
        reviewPagingDTO.setPageBlock(5);
        reviewPagingDTO.setPageSize(6);
        reviewPagingDTO.setTotalA(totalA);
        reviewPagingDTO.makePaingHTML();

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("reviewPaging", reviewPagingDTO);
        map.put("totalA", totalA);

        return map;
	}
	
	@Override
	public void setBestReview(String no, String mem_id) {
        Map<String, Object> tempMap = new HashMap<String, Object>();
        tempMap.put("mem_id", mem_id);
        tempMap.put("b_no", no);
		mypageDAO.setBestReview(tempMap);
	}
	
	@Override
	public ReviewDTO getMyBest(String memId) {
        return mypageDAO.getMyBest(memId);
	}
	
	@Override
	public void deleteMyBoard(String memId) {
		mypageDAO.deleteMyBoard(memId);
	}
}
