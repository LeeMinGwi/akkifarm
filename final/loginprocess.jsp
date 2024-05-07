<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"
import = "java.text.DecimalFormat" %>
<%
String memberID, memberPW;
String loginID = request.getParameter("idbox");
String loginPW = request.getParameter("pwbox");
DecimalFormat comma = new DecimalFormat("###,###");
Class.forName("oracle.jdbc.driver.OracleDriver");
try {
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url, "test1", "1234");

	Statement stmt = conn.createStatement();
	
	String strSQL = "SELECT ID, 비밀번호, 이름 FROM 회원";
	ResultSet rs = stmt.executeQuery(strSQL);

	while(rs.next()) {
		memberID = rs.getString("ID");
		memberPW = rs.getString("비밀번호");
		if (loginID.equals(memberID) && loginPW.equals(memberPW)) {
			session.setAttribute("currentID", loginID);
			session.setAttribute("currentName", rs.getString("이름"));
			rs.close();
			stmt.close();
			conn.close();
			%><script>alert("로그인 되었습니다.");
				window.location.href = "./main.jsp";</script>
		<%}
	}
	rs.close();
	stmt.close();
	conn.close();
	%><script>alert("아이디 또는 비밀번호를 확인해주세요.");
	history.go(-1);
	</script>
<%
} catch(SQLException e) {}
%>
</table>
</body>
</html>