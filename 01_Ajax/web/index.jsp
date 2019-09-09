<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>javascript로 ajax통신하기</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
   
   <button id="btn-getAjax">get방식으로 요청</button>
   <button id="btn-postAjax">post방식으로 요청</button>
   
   <div id="result-container"></div>
   
   <script>
      $(function() {
         
         $("#btn-postAjax").click(function(){
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function(){
               if(xhr.readyState==4){
                  if(xhr.status==200){
                     $("#result-container").html(xhr.responseText)
                  }                  
               }
            }
            xhr.open("post","<%=request.getContextPath()%>/js/test?name=이태영&nickname=문세준");
            xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhr.send("name=이지연&nickname=이지연짱짱여신님");
         });
         
         $("#btn-getAjax").click(function(){
            //1.객체 생성
            var xhr = new XMLHttpRequest();
            var result = document.getElementById("result-container");
            //2.이벤트처리 함수등록
            xhr.onreadystatechange=function(){
               //readystate상태
               //status상태를 기준으로 분기해서 로직처리
               if(xhr.readyState==4){
                  if(xhr.status==200){
                     console.log(xhr.responseText);
                     result.innerHTML+=xhr.responseText;
                  }
               }
            }
            xhr.open("get","<%= request.getContextPath() %>/js/test");
            xhr.send();
         })
      });
   
   </script>
   
</body>
</html>