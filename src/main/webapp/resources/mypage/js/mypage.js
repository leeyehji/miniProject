
$(function(){
	//로그인이 안되어 있다면
	$.ajax({
		type:'post'
		,url:'/mypage/getMemId'
		,success: function(data){
			if(data == '' || data == null){
				//alert("로그인을 해 주세요.");
				location.href='/mypage/plzLogin';
			}else{
				$('#memId').text(data);
				console.log("id = "+data);
			}
		}
	});
    
	/* 프로필 사진 출력 - id를 보고 프로필 사진 출력. 만약 null 이면 이미지 태그 삭제. imageFileName은 id와 동일한 것으로 사용자가 넣는 것이 아님. service에서 넣어버림.*/
	$.ajax({
		type:'post'
		,url:'/mypage/getProfile'
		,data:{'memId':$('#memId').text()}
		,dataType:'json'
		,success: function(data){
			console.log(JSON.stringify(data));	//profileUUID:null
			
		if(data.mem_profileImage !== "" && data.mem_profileImage !== null){
				console.log(data.mem_profileImage);
				//NCP storage에 접근하여 이미지를 가져옴.
				var profileImg = "https://kr.object.ncloudstorage.com/miniproject/storage/profile/" + data.mem_profileImage;
				$('.profile').css('background-image', 'url(' + profileImg + ')');
			
			}else{
				var defaultProfileImg = "https://kr.object.ncloudstorage.com/miniproject/storage/profile/defaultProfileImage.png";
				$('.profile').css('background-image', 'url(' + defaultProfileImg + ')');
			}
			
		},error: function(e){
			console.log(e);
		}
	});
	
	/* 프로필 사진 업로드 */
	$('#changeProfileImg').change(function(img){
		console.log("프사 업로드");
		
		var formData = new FormData();
	    formData.append('img', img.target.files[0]); // 'img'는 서버에서 요구하는 키 값입니다.
	    formData.append('memId', $('#memId').text()); // 사용자 ID 등 필요한 추가 데이터
		
		var maxSize=10 * 1024 * 1024 //10MB 제한
		if(img.target.files[0].size >= maxSize){
			alert("파일 크기는 10MB 이하여야 합니다.");
		}else{
			//DB저장
			$.ajax({
				type: 'post'
				,url: '/mypage/uploadProfile'
				,processData: false
	       		,contentType: false
				,data: formData
				,success: function(){
					console.log("업로드 성공");
					
					window.location.reload();
				},error: function(e){
					console.log("업로드 실패"+e);
				}
			});//ajax
		}//용량제한 else
	});//changeProfileImg.click
	
	/*프로필 사진 삭제*/
	$('#defaultProfile').click(function(){
		$.ajax({
			type: 'post'
			,url: '/mypage/deleteProfile'
			,data: {'memId':$('#memId').text()}
			,success: function(){
				console.log("삭제 성공");
				var defaultProfileImg = "https://kr.object.ncloudstorage.com/miniproject/storage/profile/defaultProfileImage.png";
					$('.profile').css('background-image', 'url(' + defaultProfileImg + ')');
					
				window.location.reload();
			},error: function(e){
				console.log("업로드 실패"+e);
			}
			});//ajax
	});//defaultProfileImg.click
	
	/* 유저 정보 불러오기 */
	$.ajax({
		type:'post'
		,url:'/mypage/getUser'
		,data: {memId: $('#memId').text()}		//아이디를 보내서.
		,dataType: 'json'
		,success: function(memberDTO){			
			$('#memName').html(memberDTO.mem_name);	//이를 웹에 출력 
			$('#memPhone').html(memberDTO.mem_phone);
			$('#memEmail').html(memberDTO.mem_email);
			$('#memJoinDate').html(memberDTO.mem_joinDate);
			if(memberDTO.mem_gender == 0)
            	$('#memGender').html('남성');
			else
            	$('#memGender').html('여성');
		},error:function(xhr, status, error){
			console.error("Status: " + status + ", Error: " + error + ", Response: " + xhr.responseText);
	    }
	});//ajax
	
	/* 미니 캘린더 한글화. */
	$.datepicker.setDefaults({
	        dateFormat: 'yy년 mm월 dd일',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	});//datepicker.setDefault
	
	/* yyyy년 MM월 dd일 -> yyyy-MM-dd*/
	function convertDateFormat(dateText) {
	    const regex = /(\d{4})년 (\d{2})월 (\d{2})일/;
	    const match = regex.exec(dateText);
	    if (match) {
	        return `${match[1]}-${match[2]}-${match[3]}`;
	    } else {
	        return null;
	    }
	}

	var dateList=$.ajax({
							type:'post'
							,url:'/mypage/calList'
							,dataType:'json'
						});
		dateList.done(function(data){
		});
	/* 캘린더 선택 */
	$("#datepicker").datepicker({
	
       	onSelect: function(dateText) {///yyyy년 MM월 dd일
           	$("#selectDate").text("선택한 날짜: " + dateText);
           	
           	//선택한 날짜의 일정 출력
           	$('#myCalTable').html('');
           	const selectedDate = convertDateFormat(dateText);// yyyy-MM-dd 형식으로 변환
           	//console.log(selectedDate);
           	$.ajax({
           		type:'post'
           		,url:'/mypage/myCalendarTxt'
           		,dataType:'json'
           		,contentType:'application/json'
           		,data: JSON.stringify({
			        memId: $('#memId').text(),
			        selectedDate: selectedDate
			    }),success:function(data){
			    	$.each(data, function(index, calDTO){//css 조정!
			    		console.log(calDTO);
			    		var result=`<tr><th colspan="2">`
			    					+`<div class="calTitle" style="border-top:`+calDTO.color +` solid; color:`+calDTO.color+`">제목:`+calDTO.title+`</div>`
				    				+`</th></tr>`
				    				+`<tr><td>`
				    					+`<div class="calDate">시작일: `+calDTO.start+`&emsp;`
				    					+`종료일: `+calDTO.end+`</div>`
				    				+`</td></tr>`
				    				+`<tr><td colspan="2">`
				    					+`<div class="schedule" style="border-bottom:`+calDTO.color+` solid;">일정: `+calDTO.description+`</div>`
				    				+`</td></tr>`;
				    	
			    		$('#myCalTable').append(result);
			    	});
			    				    	
           		},error:function(xhr, status, error){
				console.error("Status: " + status + ", Error: " + error + ", Response: " + xhr.responseText);
	    		}
           	});//ajax
     
       	}//#selectDate
    });//datepicker 
    
    $('#myBoard').click(function(){
    	$.ajax({
           		type:'post'
           		,url:'/mypage/getReviewList'
           		,success:function(data){
           			console.log(data);
           		},error:function(xhr, status, error){
					console.error("Status: " + status + ", Error: " + error + ", Response: " + xhr.responseText);
	    		}
        });//ajax
    });//click.myBoard
    
    
    
    
    // 정규표현식을 사용하여 img 태그를 제거하고 텍스트를 추출하는 함수
	function extractTextFromHTML(htmlString) {
		// HTML img 태그를 제거하는 정규표현식
		var regex = /<img[^>]+>/gi;	  // +전역검색
		var text = htmlString.replace(regex, "");
	  
	  	// <br>태그가 있다면 제거하고 줄바꿈 넣기 (<br> </br> <br/>등 전부)
	  	var sentences = htmlString.replace(regex, "");
		var formattedText = sentences.replace(/<br\s*\/?>/g, "\n");
	  	return formattedText;
	}
	
    //나의 대표글 불러오기
    $.ajax({
    	type:'post'	//비밀글 대비
    	,url:'/mypage/getMyBest'
    	,dataType:'json'
        ,contentType:'application/json'
        ,success:function(data){
	    	console.log(JSON.stringify(data));
        	var img="https://kr.object.ncloudstorage.com/miniproject/"+data.b_THUMBNAIL;			
			//var temp='div 태그에 텍스트 출력 시 엔터가 그대로 나오는 CSS 방법. div 태그에 텍스트를 출력할 때 엔터가 그대로 나오게 하려면 CSS의 white-space 속성을 사용하면 됩니다.white-space: pre-line;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하면서 자동으로 줄바꿈이 됩니다. 3white-space: pre-wrap;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하고, 필요에 따라 자동으로 줄바꿈이 됩니다. div 태그에 텍스트 출력 시 엔터가 그대로 나오는 CSS 방법. div 태그에 텍스트를 출력할 때 엔터가 그대로 나오게 하려면 CSS의 white-space 속성을 사용하면 됩니다.white-space: pre-line;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하면서 자동으로 줄바꿈이 됩니다. 3white-space: pre-wrap;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하고, 필요에 따라 자동으로 줄바꿈이 됩니다. div 태그에 텍스트 출력 시 엔터가 그대로 나오는 CSS 방법. div 태그에 텍스트를 출력할 때 엔터가 그대로 나오게 하려면 CSS의 white-space 속성을 사용하면 됩니다.white-space: pre-line;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하면서 자동으로 줄바꿈이 됩니다. 3white-space: pre-wrap;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하고, 필요에 따라 자동으로 줄바꿈이 됩니다. div 태그에 텍스트 출력 시 엔터가 그대로 나오는 CSS 방법. div 태그에 텍스트를 출력할 때 엔터가 그대로 나오게 하려면 CSS의 white-space 속성을 사용하면 됩니다.white-space: pre-line;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하면서 자동으로 줄바꿈이 됩니다. 3white-space: pre-wrap;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하고, 필요에 따라 자동으로 줄바꿈이 됩니다. div 태그에 텍스트 출력 시 엔터가 그대로 나오는 CSS 방법. div 태그에 텍스트를 출력할 때 엔터가 그대로 나오게 하려면 CSS의 white-space 속성을 사용하면 됩니다.white-space: pre-line;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하면서 자동으로 줄바꿈이 됩니다. 3white-space: pre-wrap;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하고, 필요에 따라 자동으로 줄바꿈이 됩니다. div 태그에 텍스트 출력 시 엔터가 그대로 나오는 CSS 방법. div 태그에 텍스트를 출력할 때 엔터가 그대로 나오게 하려면 CSS의 white-space 속성을 사용하면 됩니다.white-space: pre-line;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하면서 자동으로 줄바꿈이 됩니다. 3white-space: pre-wrap;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하고, 필요에 따라 자동으로 줄바꿈이 됩니다. div 태그에 텍스트 출력 시 엔터가 그대로 나오는 CSS 방법. div 태그에 텍스트를 출력할 때 엔터가 그대로 나오게 하려면 CSS의 white-space 속성을 사용하면 됩니다.white-space: pre-line;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하면서 자동으로 줄바꿈이 됩니다. 3white-space: pre-wrap;: 텍스트 내의 공백 문자스페이스, 탭, 엔터를 유지하고, 필요에 따라 자동으로 줄바꿈이 됩니다. 4이를 통해 HTML 문서에서 텍스트 내용을 효과적으로 추출하고, 가독성 있게 표시할 수 있습니다. 말줄임표내놔🙂. 이자식아.';
			var content = extractTextFromHTML(data.b_CONTENT);
			var title = data.b_TITLE;
			
			$('#box1Title').html(title);
			$('#box1Txt').html( content );
			//$('#box1Txt').html( temp );
			$('#box1Img').css('background-image','url("'+img+'")');//대표글 이미지 DB에서 가져오기
        	
        	
        	
        	
        },error:function(xhr, status, error){
			console.error("Status: " + status + ",\nError: " + error + ",\nResponse: " + xhr.responseText);
	    }
    });//ajax 대표글
    
    $('#deleteMyBoard').click(function(){
    	$.ajax({
    		type:'post'
    		,url:'/mypage/deleteMyBoard'
    		,success:function(){
    			alert('대표글이 삭제 되었습니다.');
    			location.href='/mypage/mypage';
    		},error:function(xhr, status, error){
				console.error("Status: " + status + ",\nError: " + error + ",\nResponse: " + xhr.responseText);
	    	}
    	});//ajax
    });//click deleteMyBoard

});//function()
