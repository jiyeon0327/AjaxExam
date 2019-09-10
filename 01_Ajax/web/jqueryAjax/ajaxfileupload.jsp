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
	<input type="file" name="upfile" id="upfile" multiple/>
	<!--multiple은 다중으로 갖고올수 있는데!!!!
	name은 0만 알고, multiple은 배열로 가져와서 문제가 될수 있음. 이럴땐 
	  -->
	<button id="up-btn">업로드</button>
	<div id="preview"></div>
	<script>
	//사진 미리보기 기능!
	$(function(){
		$("#upfile").change(function(){
			//다중multi~
			$("#preview").html("");//사진 미리보기 다나오도록
			$.each($(this)[0].files,function(i,item){
				var reader = new FileReader();
				reader.onload=function(e){
					var img=$("<img>").attr({"src":e.target.result}).css({"width":"200px","height":"200px"});
					$("#preview").append(img);//사진미리보기에서 사진 선택한거 다 나오게
				}
				reader.readAsDataURL(item);//파일마다 이제 생성돼. 반복되면서
				
				//console.log(item);//사진들이 각각 다 console창에서 file로 나와
			});
			
			
			//change:value값이 변경돼서 확정되면 실행
			/* var reader=new FileReader();//파일경로함부로 알려주면 안됨..읽어오면서 경로 변경해줌
			reader.onload=function(e){
				var img=$("<img>").attr({"src":e.target.result}).css({"width":"200px","height":"200px"});
				$("#preview").html(img);
			}
			reader.readAsDataURL($(this)[0].files[0]); *///파일태그 안에 배열에 0번쨰 대한 것을 불러오기 =>이건 단일파일(다중파일도 가능)
			//e에 바뀐 모든 정보가 있음//readAsDataURL에 바뀐 url주소가 e에 들어가있고
			
		});
		$("#up-btn").on("click",function(){
			//ajax를 통한 파일전송을 할때
			//FormData() 객체를 이용
			var fd=new FormData();
			$.each($("#upfile")[0].files,function(i,item){
				fd.append("file"+i,item);
			});
			//fd.append("upfile",$("#upfile")[0].files[0])
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