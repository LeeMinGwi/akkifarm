<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"
import = "java.text.DecimalFormat" %>
<%
String phone = request.getParameter("pnbox");
String addr = request.getParameter("addrbox");
String currentID = (String)session.getAttribute("currentID");

DecimalFormat comma = new DecimalFormat("###,###");
Class.forName("oracle.jdbc.driver.OracleDriver");
if (currentID.equals("administrator")) {
	%><script>alert("관리자 계정은 수정할 수 없습니다.");
	window.location.href = "./memberinfo.jsp";</script>
<%
} else {
	try {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521";
		Connection conn = DriverManager.getConnection(url, "test1", "1234");
	
		Statement stmt = conn.createStatement();

		if (phone.equals("")) {
			stmt.close();
			conn.close();
			%><script>alert("연락처를 입력하세요.");
			history.go(-1);</script>
		<%} else
		if (addr.equals("")) {
			stmt.close();
			conn.close();
			%><script>alert("주소를 입력하세요.");
			history.go(-1);</script>
		<%}
	
		stmt.executeUpdate("UPDATE 회원 SET 연락처=\'" + phone + "\', 주소=\'" + addr + "\' WHERE ID=\'" + currentID + "\'");
		stmt.close();
		conn.close();
		%><script>alert("수정되었습니다.");
		window.location.href = "./memberinfo.jsp";</script>
	<%
	} catch(SQLException e) {}
}
%>
</table>
</body>
</html>