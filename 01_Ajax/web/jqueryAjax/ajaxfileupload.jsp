<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax로 파일 업로드하기</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<input type="file" name="upfile" id="upfile"/>
	<button id="up-btn">업로드</button>
	<div id="preview"></div>
	<script>
	//사진 미리보기 기능!
	$(function(){
		$("#upfile").change(function(){
			//change:value값이 변경돼서 확정되면 실행
			var reader=new FileReader();//파일경로함부로 알려주면 안됨..읽어오면서 경로 변경해줌
			reader.onload=function(e){
				var img=$("<img>").attr({"src":e.target.result}).css({"width":"200px","height":"200px"});
				$("#preview").html(img);
			}
			reader.readAsDataURL($(this)[0].files[0]);//파일태그 안에 배열에 0번쨰 대한 것을 불러오기 =>이건 단일파일
			//e에 바뀐 모든 정보가 있음//readAsDataURL에 바뀐 url주소가 e에 들어가있고
			
		});
		$("#up-btn").on("click",function(){
			//ajax를 통한 파일전송을 할때
			//FormData() 객체를 이용
			var fd=new FormData();
			fd.append("upfile",$("#upfile")[0].files[0])
			//위 두개를 날리기
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajaxFile",
				data:fd,
				type:"post", //무조건 post로 할것
				processData:false,
				contentType:false,
				success:function(data){
					console.log(data);
					//남아있는 값(사진,출력된값) 비워주기
					$("#preview").html("");
					$("#upfile").val("");
				}
			});
		});
	});
	
	
	</script>
	
	
</body>
</html>