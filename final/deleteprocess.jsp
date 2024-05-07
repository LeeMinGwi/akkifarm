<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"%>
<%
String id = request.getParameter("goodID");
Class.forName("oracle.jdbc.driver.OracleDriver");
try {
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url, "test1", "1234");
	Statement stmt = conn.createStatement();
	
	stmt.executeUpdate("DELETE FROM 주문 WHERE 상품번호=" + id);
	stmt.executeUpdate("DELETE FROM 상품 WHERE 상품번호=" + id);
	stmt.close();
	conn.close();
	%><script>alert("상품이 삭제되었습니다.");
	window.location.href = "./main.jsp"</script>
<%
} catch(SQLException e) {}
%>
</table>
</body>
</html>