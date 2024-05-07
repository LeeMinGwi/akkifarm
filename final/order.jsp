<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"
import = "java.text.DecimalFormat" %>
<%
int outID=-1, outKind=-1, outPrice=-1;
String outName=null, outManuf=null, outImage=null, name=null, defaultaddr=null;
DecimalFormat comma = new DecimalFormat("###,###");
String goodID = request.getParameter("goodID");   
Class.forName("oracle.jdbc.driver.OracleDriver");
try {
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url, "test1", "1234");

	Statement stmt = conn.createStatement();
%>
<html>
<title>상품주문</title>
<body>
<%@ include file="./menu.jsp" %>
	<%if(isLogin == 0) {
		%><script>alert("주문하려면 로그인하세요.");
		window.location.href = "./login.jsp";</script>
	<%}
	if(isLogin == 2) {
		%><script>alert("관리자계정으로 주문할 수 없습니다.");
		window.location.href = "./login.jsp";</script>
	<%}%>

<table align="center" width="1000">
<tr height="100"><td></td></tr>
<tr height="20">
<td colspan=3><b><font size="5">● 상품주문</b></font></td>
</tr>
<tr height="50"><td></td></tr>
<%
	ResultSet rs = stmt.executeQuery("SELECT * FROM 상품 WHERE 상품번호=" + goodID);
	if(rs.next()) {
		outImage = rs.getString("이미지");
		outName = rs.getString("상품명");
		outManuf = rs.getString("제조사");
		outPrice = rs.getInt("가격");
	}
%>
<tr height="50"><td width="120" align="center">상품사진</td>
<td width=700 align="center">상품명</td>
<td width=180 align="center">가격</td></tr>

<tr height="120"><td width="120"><img src="./images/<%=outImage%>" width=120></td>
<td width=700 align="center"><%=outName%></td>
<td width=180 align="center"><%=comma.format(outPrice)%>원</td></tr>
</table>
<table width=1000 align="center">
<%
	rs = stmt.executeQuery("SELECT 이름, 주소 FROM 회원 WHERE ID=\'"+currentID+"\'");
	if(rs.next()) {
		name=rs.getString("이름");
		defaultaddr=rs.getString("주소");
	}
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {}
%>
<tr height=50 valign="top"><td width=160>주문자</td><td width=840><%=name%></td></tr>
<tr height=50 valign="top"><td width=160>배송지</td>
<td width=840><form name="addrform" action="./orderprocess.jsp"><input type="text" name="addr" value="<%=defaultaddr%>" style="width:700px;height:25px">
<input type="hidden" name="goodID" value="<%=goodID%>"></form></td></tr>
<tr height=150><td colspan=2 align="center"><a href="#" onclick="javacsript:document.addrform.submit();">주문하기</a></td></tr>
</table>
</body>
</html>-
