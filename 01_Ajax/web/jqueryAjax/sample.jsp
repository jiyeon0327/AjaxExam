<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--ajax는 페이지의 일부분만 들어갈것이기 때문에 html부분은 필요하지 않는다.                              -->
<%@ page import="java.util.List,com.ajax.model.vo.*" %>
<%
	List<Member> list=(List)request.getAttribute("list");
%>
<table>
	<tr>
		<th>이름</th>
		<th>전화번호</th>
		<th>프로필</th>
	</tr>
	<%for(Member m:list) {%>
		<tr>
			<td><%=m.getName() %></td>
			<td><%=m.getPhone() %></td>
			<td>
				<img alt="" src="<%=request.getContextPath() %>/images/<%=m.getProfile() %>">
			</td>
			
		</tr>
	<% } %>


</table>










