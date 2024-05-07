<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"
import = "java.text.DecimalFormat" %>
<%
String currentID = (String)session.getAttribute("currentID");
if (currentID.equals("administrator")) {
	%><script>alert("관리자는 탈퇴할 수 없습니다.");
	window.location.href = "./main.jsp"</script>
<%} else {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	try {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521";
		Connection conn = DriverManager.getConnection(url, "test1", "1234");

		Statement stmt = conn.createStatement();
	
		stmt.executeUpdate("DELETE FROM 주문 WHERE ID=\'" + currentID + "\'");
		stmt.executeUpdate("DELETE FROM 회원 WHERE ID=\'" + currentID + "\'");

		stmt.close();
		conn.close();
		session.invalidate();
		%><script>alert("탈퇴처리되었습니다.");
		window.location.href = "./main.jsp"</script>
<%
	} catch(SQLException e) {}
}
%>
</table>
</body>
</html>