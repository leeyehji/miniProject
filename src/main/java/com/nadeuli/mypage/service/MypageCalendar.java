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
import com.nadeuli.mypage.dao.MypageDAO;
import com.nadeuli.mypage.dto.CalDTO;
import com.nadeuli.mypage.dto.MemberDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class MypageCalendar implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;
	@Autowired
	private ObjectStorageService objectStorageService;
	private String bucketName = "miniproject";
	
	@Override
	public void calWrite(CalDTO calDTO) {
		mypageDAO.calWrite(calDTO);
	}//write
	
	@Override
	public List<Map<String, Object>> calList() {
		List<CalDTO> listAll= mypageDAO.calList();
		
		JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
		
        HashMap<String, Object> hash = new HashMap<>();
        
        //System.out.println("MyCalendarController calList");
        for (int i = 0; i < listAll.size(); i++) {
        	//System.out.println("title:"+listAll.get(i).getCal_title());
        	//2022-02-19T03:05:49.275+00:00 형식이 되도록
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
        	//SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
        	Object start=sdf.format(listAll.get(i).getCal_startDate()); 
        	
        	Object end=sdf.format(listAll.get(i).getCal_endDate()); 
        	Object color = listAll.get(i).getCal_color();
        	Object id = listAll.get(i).getCal_no();
            hash.put("title", listAll.get(i).getCal_title());
            hash.put("start", start);
            hash.put("end", end);
            hash.put("description",listAll.get(i).getCal_memo() );
            hash.put("color", color);//borderColor, backgroundColor 동일하게
            hash.put("id", id);
            //textColor
            jsonObj = JSONObject.fromObject(hash);;
            jsonArr.add(jsonObj);
        }
        //log.info("jsonArrCheck: {}", jsonArr);
        return jsonArr;
	}
	
	@Override
	public void calDelete(int cal_no) {
		mypageDAO.calDelete(cal_no);	
	}
	
	@Override
	public void calUpdate(CalDTO calDTO) {
		mypageDAO.calUpdate(calDTO);
	}
	
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
    	System.out.println("실제폴더 = " + filePath);
    	
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
		objectStorageService.deleteFile(bucketName,"profile/"+imageFileName);
		System.out.println("ncp 삭제");
		
		//MySQL 삭제
		mypageDAO.deleteFile(memberDTO);
	}
	
}
