<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	img{
		width:100px;
	
	}
	table{
		border:1px solid;
		border-collapse:collapse;
		}
	th,td{
		border:1px solid; padding:10px;
	}



</style>
</head>
<body>
	<button id="btn-text">문서내용불러오기</button>
	<div id="result"></div>
	<script>
		$(function(){
			$("#btn-text").click(function(){
				$.ajax({
					url:"sampleData.txt",		
					dataType:"text",//text,html,script,xml,json불러올수 있음
					type:"get",     //get||post
					success:function(data){//매개변수에 응답값이 대입됨,ㅂ매개변수명은 바꿔도 상관없음
						$("#result").html(data);
					//속성값은 필요한 것만 적으면 됨...!!
						
					}	
				});
			});
		});
	
	
	
	</script>
	<button id="btn-html">html불러오기</button>
	<div id="html-container"></div>
	<script>
		$(function(){
			$("#btn-html").click(function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/js/html",
					type:"get",
					dataType:"html",
					success:function(data){
						$("#html-container").html(data);
					}
				});
			});
		});

	</script>
	<!--csv방식으로 값받아오기  -->
	<button onclick="fn_csv();">csv방식으로 받기</button>
	<div id="csv-container"></div>
	<script>
		//요청주소//js/csvData
		//방식 :get 응답데이터 형식 text
		function fn_csv(){
			$.ajax({
				//객체의 맴버변수들이라서 ','로 구분하기(;은 안됩니다.)
				url:"<%=request.getContextPath()%>/js/csvData",
				type:"get",
				dataType:"text",
				success:function(data){
					console.log(data);//데이터로 한번 잘나오는지 확인해보기
					var memberArr = data.split("\n");//사람별로 나누어짐
					var table = $("<table>");
					for(var i=0;i<memberArr.length;i++){
						var member = memberArr[i].split(",");//이렇게 하면 맴버가 각 객체의 각각의 데이터가 나오게 함! 배열순서대로
						var tr=$("<tr>");
						var td=$("<td>").html(member[0]);//이름
						var td2=$("<td>").html(member[1]);//전화번호
						//프로필
						var td3=$("<td>")
						.html($("<img>")
						.attr({"src":"<%=request.getContextPath()%>/images/"+member[2]}));

						tr.append(td).append(td2).append(td3);
						table.append(tr);
					}		
					$("#csv-container").html(table);//이것보다 jsp를 html로 보내는 것이 편하다
				}
			});
		}
	</script>
	<!--자동검색 -->
	<input type="text" id="search" list="data"/>
	<list id="data">
		<option value="kim">kim</option>
	</list>
	
	<script>
	//검색해서 검색한 값과 일치하는 것들 출력함
		$("#search").keyup(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/search",
				type:"get",
				data:{"key":$(this).val()},//key:value형식으로 보내기
				dataType:"text",
				success:function(data){
					var ids=data.split(",");
					$("#data").html("");
					for(var i=0;i<ids.length;i++){
						var option=$("<option>").attr({"value":ids[i]}).html(ids[i]);
						$("#data").append(option);//계속 누적이됨
					}
				}
			});
		});
	
	
	</script>
	<!--XML파일 불러오기  -->
	<button id="xml-btn">XML파일 불러오기</button>
	<div id="fiction">
		<h3>소설</h3>
		<table id="fictionInfo"></table>
	</div>
	<div id="it">
		<h3>프로그래밍</h3>
		<table id="itInfo"></table>
	</div>
	<script>
		$(function(){
			$("#xml-btn").click(function(){
				$.ajax({
					url:"books.xml",
					type:"get",
					dataType:"xml",
					success:function(data){
						console.log(data);
						//태그형식으로 나오기 때문에
						//1.root element로 받아오기==>books
						var root=$(data).find("root");
						console.log(root);
						//2.하위 태그 찾기
						var bookArr=root.find("book");
						console.log(bookArr);
						var fic="<tr><th>제목</th><th>저자</th></tr>";
						var it="<tr><th>제목</th><th>저자</th></tr>";
						//each문은 앞에 그룹이나온다. 주체가 되는 객체가 그룹인 애(배열,리스트, 객체배열)
						//[1,2,3,4,5]인 배열을 각각 데이터를 돌린다. each문으로 
						//each(함수, 어떤 명령어)
						bookArr.each(function(){
							//$(this)는 each문에서 현재 회전에 맞는 하나의 booktag를 의미
							var info = "<tr><td>"+$(this).find("title").text()+"</td>";
							info+="<td>"+$(this).find("author").text()+"</td></tr>";
							if($(this).find("subject").text()=="소설"){
								fic+=(info);
							}else{
								it+=info;
							}
						
						});
						$("#fictionInfo").html(fic);
						$("#itInfo").html(it);
					}
				});
			});
		});
	</script>
	<h2>son으로 자바 객체 가져오기 </h2>
	<button onclick="ajaxJson();">데이터 가져오기!</button>
	<div id="json-container"></div>
	<script>
		function ajaxJson(){
			$.ajax({
				url:"<%=request.getContextPath()%>/jsonData",
				type:"get",//get,post 둘중 아무거나 상관없음
				data:{"no":10},
				dataType:"json",//안적어도 자동으로 되지만 적어주는 편이 좋다.
				success:function(data){
					console.log(data);//json으로 데이터가 잘 넘어가는지 보기
					
					var table=$("<table>");
					for(var i=0;i<data.length;i++){
						var td=$("<td>").html(data[i]['name']);
						var td2=$("<td>").html(data[i]['phone']);
						var td3=$("<td>").html(data[i]['profile']);
						table.append($("<tr>")).append(td).append(td2).append(td3);
					}
					$("#json-container").html(table); 
					
					/* var table=$("<table>");
					var th="<tr><th>번호</th><th>아이디</th><th>이름</th><th>주소</th><th>키</th><th>flag</th></tr>";
					var tr="<tr><td>"+data["userNo"]+"</td>"
							+"<td>"+data["userId"]+"</td>"
							+"<td>"+data["userName"]+"</td>"
							+"<td>"+data["userAddr"]+"</td>"
							+"<td>"+data["height"]+"</td>"
							+"<td>"+data["flag"]+"</td></tr>";
					table.append(th).append(tr);
					$("#json-container").html(table); */
					
				/* 	console.log(data['userNo']);
					console.log(data['userName']); */
				},
				error:function(r,e,m){
					console.log(e);
				}
			});
		}
	</script>
	
</body>
</html>