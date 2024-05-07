<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"%>
<html>
<body>
<%
String addr = request.getParameter("addr");
String id = (String)session.getAttribute("currentID");
String goodID = request.getParameter("goodID");
if (addr.equals("")) {
		%><script>alert("주소를 입력하세요.");
		history.go(-1);</script>
<%}
Class.forName("oracle.jdbc.driver.OracleDriver");
try {
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url, "test1", "1234");

	Statement stmt = conn.createStatement();

	stmt.executeUpdate("INSERT INTO 주문 VALUES (NO_SEQ.NEXTVAL, \'" + id + "\'," + goodID + ",\'" + addr + "\')");
	stmt.close();
	conn.close();
	%><script>alert("주문되었습니다.");
	window.location.href = "./main.jsp";</script>
<%
} catch(SQLException e) {}
%>
</body>
</html>