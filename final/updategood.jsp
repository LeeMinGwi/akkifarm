<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"
import = "java.text.DecimalFormat" %>
<%
int outID=-1, outKind=-1, outPrice=-1;
String outName=null, outManuf=null, outImage=null;
String goodID = request.getParameter("goodID");

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
<tr height="100"><td colspan="3"><font size="6"><b>● 상품정보 수정</b></font></td></tr>
<%
try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");
	Statement stmt = conn.createStatement();

	ResultSet rs = stmt.executeQuery("SELECT * FROM 상품 WHERE 상품번호=" + goodID);
	if (rs.next()) {
		outID = rs.getInt("상품번호");
		outName = rs.getString("상품명");
		outManuf = rs.getString("제조사");
		outKind = rs.getInt("분류코드");
		outPrice = rs.getInt("가격");
		outImage = rs.getString("이미지");
	%><tr height=50 valign="top"><td width=100>상품번호</td><td width=700><%=outID%></td></tr>
	<tr valign="top" height=50><td width=100>상품명</td><td width=700>
	<form name="updateform" action="./updategoodprocess.jsp" enctype="multipart/form-data" method="post">
	<input type="hidden" name="id" value="<%=goodID%>">
	<input type="text" name="name" value="<%=outName%>" style="width:300;height:25"></td></tr>
	<tr valign="top" height=50><td width=100>제조사</td><td width=700>
	<input type="text" name="manuf" value="<%=outManuf%>" style="width:150;height:25"></td></tr>
	<tr valign="top" height=50><td width=100>분류</td><td width=700>
	<%if (outKind==1) {%>
	<input type="radio" name="kind" value=1 checked>피아노
	<% } else { %>
	<input type="radio" name="kind" value=1>피아노
	<%}
	if (outKind==2) {%>
	<input type="radio" name="kind" value=2 checked>플룻
	<% } else { %>
	<input type="radio" name="kind" value=2>플룻
	<%}
	if (outKind==3) {%>
	<input type="radio" name="kind" value=3 checked>바이올린
	<% } else { %>
	<input type="radio" name="kind" value=3>바이올린
	<%}
	if (outKind==4) {%>
	<input type="radio" name="kind" value=4 checked>기타
	<% } else { %>
	<input type="radio" name="kind" value=4>기타
	<%}
	if (outKind==5) {%>
	<input type="radio" name="kind" value=5 checked>드럼
	<% } else { %>
	<input type="radio" name="kind" value=5>드럼
	<%}%>
	</td></tr>
	<tr valign="top" height=50><td width=100>가격</td><td width=700>
	<input type="text" name="price" value="<%=outPrice%>" style="width:150;height:25"></td></tr>
	<tr valign="top" height=150><td width=100>상품 이미지</td><td width=700>
	<input type="file" name="image" value="<%=outImage%>"></td></tr>
	</table>
	<table width=800 align="center">
	<tr height=50><td width=400 align="center"><a href="./deleteprocess.jsp?goodID=<%=outID%>">상품삭제</a></td>
	<td width=400 align="center"><a href="#" onclick="javacsript:document.updateform.submit();">수정하기</a></td></tr>
	</table>
	<%}
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {}
%>
</body>
</html>
