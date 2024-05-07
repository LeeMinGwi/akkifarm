<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"
import = "java.text.DecimalFormat" %>
<%
String name = request.getParameter("namebox");
String id = request.getParameter("idbox");
String pw1 = request.getParameter("pw1box");
String pw2 = request.getParameter("pw2box");
String birth = request.getParameter("birthbox");
String phone = request.getParameter("pnbox");
String addr = request.getParameter("addrbox");
String memberID;

if (name.equals("")) {
	%><script>alert("이름을 입력하세요.");
	history.go(-1);</script>
<%}

DecimalFormat comma = new DecimalFormat("###,###");
Class.forName("oracle.jdbc.driver.OracleDriver");
try {
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url, "test1", "1234");

	Statement stmt = conn.createStatement();
	
	String strSQL = "SELECT ID FROM 회원";
	ResultSet rs = stmt.executeQuery(strSQL);

	while(rs.next()) {
		memberID = rs.getString("ID");
		if (id.equals(memberID)) {
			rs.close();
			stmt.close();
			conn.close();
			%><script>alert("중복된 아이디입니다.");
				history.go(-1);</script>
		<%}
	}
	if (pw1.equals("")) {
		rs.close();
		stmt.close();
		conn.close();
		%><script>alert("비밀번호를 입력하세요.");
		history.go(-1);</script>
	<%} else
	if (!pw1.equals(pw2)) {
		rs.close();
		stmt.close();
		conn.close();
		%><script>alert("비밀번호가 다릅니다.");
		history.go(-1);</script>
	<%} else
	if (birth.equals("")) {
		rs.close();
		stmt.close();
		conn.close();
		%><script>alert("생년월일을 입력하세요.");
		history.go(-1);</script>
	<%} else
	if (addr.equals("")) {
		rs.close();
		stmt.close();
		conn.close();
		%><script>alert("주소를 입력하세요.");
		history.go(-1);</script>
	<%} else
	if (phone.equals("")) {
		rs.close();
		stmt.close();
		conn.close();
		%><script>alert("연락처를 입력하세요.");
		history.go(-1);</script>
	<%}
	stmt.executeUpdate("INSERT INTO 회원 VALUES (\'"+id+"\',\'"+name+"\',\'"+pw1+"\',\'"+birth+"\',\'"+addr+"\',\'"+phone+"\')");
	rs.close();
	stmt.close();
	conn.close();
	%><script>alert("회원가입 되었습니다.");
	window.location.href = "./main.jsp";</script>
<%
} catch(SQLException e) {}
%>
</table>
</body>
</html>