<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!--jQuery-->
    <script src="http://code.jQuery.com/jquery-3.7.1.min.js">//선언.internet필수.</script>

    <!-- Step 1) Load D3.js -->
    <script src="https://d3js.org/d3.v6.min.js"></script>

    <!-- Step 2) Load billboard.js with style -->
    <link rel="stylesheet" href="/mypage/css/billboard.css">
    <script src="/mypage/js/billboard.js"></script>
    
    <!-- Or load different theme style -->
    <link rel="stylesheet" href="/mypage/css/insight.min.css">

    <style>
        #chart1,#chart2 {
            width:800px;
        }
    </style>


</head>
<body>
	<div>차트페이지입니다.</div>
    <div id="chart1">1번</div>
    <div id="chart2">2번</div>

	<script>
	$(function(){
		console.log("차트 페이지");
		$.ajax({
			type: 'get'
			,url:'/mypage/showChart'
			,dataType: 'json'
			,contentType: 'application/json'
			,success:function(data){
				/*setinterval으로 show, hide 고민.*/
				console.log(JSON.stringify(data));
				
				var chartData = [];
					$.each(data, function(index, item) {
				    	//chartData.push([item.dataName, 5]);
				    	chartData.push([item.dataName, item.dataValue]);
				    });
				console.log(chartData);

				
				 var chart = bb.generate({
		                bindto: "#chart1",
		                title:{
		                    text: "서울내 시군구별 관광지 소개글 조회수"
		                },padding:{
		                    top:10
		                    ,bottom:20
		                },data: {
		                	 type: "treemap"
		                	,columns: chartData
		                	,labels: {
		                        colors: "black"
		                    },colors: {
		                    	/*서울 전지역 색상 설정. 파스텔톤.*/
		                    	"강남구":		"#ADDDFF"
		                    	,"강동구":	"#C9D8FF"
		                    	,"강북구": 	"#CCDBE6"
		                    	,"강서구":	"#CBE2F2"
		                    	,"관악구":	"#FFF4C9"
		                    	,"광진구":	"#A5CCC7"
		                    	,"구로구":	"#FFE9C9"
			                    ,"금천구":	"#C9FFF3"
		                    	,"노원구":	"#FFF0C9"
		                    	,"도봉구":	"#DBD2BE"
		                    	,"동대문구":	"#BECEDB"
		                        ,"동작구":	"#A5BCCC"
								,"마포구": 	"#E6DBCC"
								,"서대문구":	"#CCC9FF"
								,"서초구":	"#BFD0FF"
								,"성동구":	"#99BFB6"
								,"성북구":	"#BFFFF0"
								,"송파구":	"#99A3BF"
		                        ,"양천구": 	"#C9E9FF"
		                        ,"영등포구":	"#ECBFFF"
		                        ,"용산구":	"#FFBFD6"
		                        ,"은평구":	"#F4D9FF"
		                        ,"종로구":	"#FFD9E6"
		                        ,"중구":		"#C9FAFF"
		                        ,"중랑구":	"#69C0FF"

		                      }
		                },treemap: {
		                    label: {
		                        threshold: 0.001
		                    }
		                }
		            });

				 	/*line 또는 bubble, scatter 형식의 인기 검색어/인기 태그/인기글(B_LIKE, B_COMMENTCOUNT, B_VIEW)*/
					var chart = bb.generate({
			             data: {
			                 /*columns대신 url:"./aa.json, mimeType:"json"*/
			                 columns: [
			                     ["data1", 30, 200, 100, 400, 150, 250],
			                     ["data2", 130, 100, 140, 200, 150, 50]
			                 ],type: "area"
			                 ,colors: {
			                     data1: "green",
			                     data2: "skyblue"
			                 },labels:{
			                     colors: "#fff"
			                     ,centered:true
			                     ,format:{
			                         data1: function(x){return d3.format(x)+('명');}
			                     }
			                 },names: {
			                     data1: "오늘 작성된 글 수",
			                     data2: "어제까지 작성된 글 수"
			                 },onmax:{

			                 },selection: {
			                     enabled: true,
			                     draggable: true
			                 },stack: {
			                     normalize: true
			                 },clipPath: false
			                 ,groups: [
			                     [
			                         "data1",
			                         "data2"
			                     ]
			                 ]
			             },
			             bar: {
			                 width: {
			                     ratio: 0.5
			                 }
			             },axis:{
			                 x:{
			                     label:"달"
			                 },y:{
			                     label:"작성한 글 수"
			                 }
			             },zoom: {
			                 enabled: true
			                 
			             },point: {
			                 pattern: [
			                     "circle",
			                     "<polygon points='4 0 0 4 4 8 8 4 4 0'></polygon>"
			                 ]
			             },bindto: "#chart2"
			         });
			}, error: function(xhr, status, error){
				console.error("Status: " + status + ", Error: " + error + ", Response: " + xhr.responseText);
		    }
		});//ajax
		
		
		 
	});

	</script>
</body>
</html>