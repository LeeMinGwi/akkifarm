<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"
import = "java.text.DecimalFormat" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
%>
<html>
<head>
<title>상품정보수정</title>
</head>
<body>
<%@ include file="./menu.jsp" %>
<table width="800" align="center">
<tr height="80"><td></td></tr>
<tr height="100"><td colspan="3"><font size="6"><b>● 상품등록</b></font></td></tr>
<%
try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");
	Statement stmt = conn.createStatement();
%>
	<tr valign="top" height=50><td width=100>상품명</td><td width=700>
	<form name="regform" action="./regprocess.jsp" enctype="multipart/form-data" method="post">
	<input type="text" name="name" style="width:300;height:25"></td></tr>
	<tr valign="top" height=50><td width=100>제조사</td><td width=700>
	<input type="text" name="manuf" style="width:150;height:25"></td></tr>
	<tr valign="top" height=50><td width=100>분류</td><td width=700>
	<input type="radio" name="kind" value=1>피아노
	<input type="radio" name="kind" value=2>플룻
	<input type="radio" name="kind" value=3>바이올린
	<input type="radio" name="kind" value=4>기타
	<input type="radio" name="kind" value=5>드럼
	</td></tr>
	<tr valign="top" height=50><td width=100>가격</td><td width=700>
	<input type="text" name="price" style="width:150;height:25"></td></tr>
	<tr valign="top" height=150><td width=100>상품 이미지</td><td width=700>
	<input type="file" name="image""></td></tr>
	</table>
	<table width=800 align="center">
	<tr height=50><td width=400 align="center">
	<a href="#" onclick="javacsript:document.regform.submit();">등록하기</a></td></tr>
	</table>
	<%
	stmt.close();
	conn.close();
} catch(SQLException e) {}
%>
</body>
</html>
