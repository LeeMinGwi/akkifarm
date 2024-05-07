<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,
                   com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                   java.io.*" %>
<%@ page import="thinkonweb.util.*" %> 
<%
String imagefile = null;
request.setCharacterEncoding("utf-8");
String savePath = application.getRealPath("./images");
int sizeLimit = 10 * 1024 * 1024; 
MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());  
Class.forName("oracle.jdbc.driver.OracleDriver");
File file = multi.getFile("image"); 
String id = multi.getParameter("id");
String name = multi.getParameter("name");
String manuf = multi.getParameter("manuf");
String kind = multi.getParameter("kind");
String price = multi.getParameter("price");
imagefile = file.getName();
try {
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url, "test1", "1234");
	
	Statement stmt = conn.createStatement();
	
	if(name.equals("")) {
		stmt.close();
		conn.close();
		%><script>alert("상품명을 입력하세요.");
		history.go(-1);</script>
	<%} else
	if(manuf.equals("")) {
		stmt.close();
		conn.close();
		%><script>alert("제조사를 입력하세요.");
		history.go(-1);</script>
	<%} else
	if(manuf.equals("")) {
		stmt.close();
		conn.close();
		%><script>alert("제조사를 입력하세요.");
		history.go(-1);</script>
	<%} else
	if(kind.equals("")) {
		stmt.close();
		conn.close();
		%><script>alert("분류를 선택하세요.");
		history.go(-1);</script>
	<%} else
	if(price.equals("")) {
		stmt.close();
		conn.close();
		%><script>alert("가격을 입력하세요.");
		history.go(-1);</script>
	<%} else
	if(imagefile.equals("")) {
		stmt.close();
		conn.close();
		%><script>alert("이미지를 업로드하세요.");
		history.go(-1);</script>
	<%}
	stmt.executeUpdate("UPDATE 상품 SET 상품명=\'" + name +
				"\', 제조사=\'" + manuf +
				"\', 이미지=\'" + imagefile +
				"\', 분류코드=" + kind +
				", 가격=" + price + "WHERE 상품번호 =" + id);
	stmt.close();
	conn.close();
	%><script>alert("수정되었습니다.");
	window.location.href = "./detail.jsp?goodID=<%=id%>";</script>
	<%
	} catch(SQLException e) {}
%>