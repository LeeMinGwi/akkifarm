<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<html>
<title>회원가입</title>
<body>
<%@ include file="./menu.jsp" %>
<%
String memberID=null, memberName=null, memberBirth=null;
try {
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url, "test1", "1234");

	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("SELECT * FROM 회원 WHERE ID=\'"+currentID+"\'");
	if(rs.next()) {
		memberID = rs.getString("ID");
		memberName = rs.getString("이름");
		memberBirth = rs.getString("생년월일"); 
	}
%>

<table width="800" align="center">
<tr height="80"><td></td></tr>
<tr height=50><td width = 160>ID</td><td>
		<%out.print(memberID);%></td></tr>
<tr height=50><td width = 160>이름</td><td>
		<%out.print(memberName);%></td></tr>
<tr height=50><td width = 160>생년월일</td><td>
		<%out.print(memberBirth);%></td></tr>
<tr height="40" valign="top">
<td width="160">연락처</td>
<td colspan="2"><form name="updateform" action="./updateprocess.jsp"><input type="text" name="pnbox" style="width:140px;height:30"></td>
</tr>
<tr height="40" valign="top">
<td width="160">주소</td>
<td colspan="2"><input type="text" name="addrbox" style="width:600px;height:30"></form></td>
</tr>
</table>
</table>
<table width="400" align="center">
<tr height="80">
<td width="200" align="center"><a href="#" onclick="javacsript:document.updateform.submit();">정보수정</a></td>
</tr>
</table>
<%
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {}
%>
</body>
</html>