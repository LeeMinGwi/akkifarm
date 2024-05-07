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
	stmt.executeUpdate("INSERT INTO 상품 VALUES(GOOD_SEQ.NEXTVAL, \'" + name +
				"\',\'" + manuf + "\'," + price + ", " + kind + ",\'" + imagefile + "\', 0)");
	stmt.close();
	conn.close();
	%><script>alert("등록되었습니다.");
	window.location.href = "./main.jsp";</script>
	<%
	} catch(SQLException e) {}
%>