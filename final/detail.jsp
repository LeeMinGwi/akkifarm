<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"
import = "java.text.DecimalFormat" %>
<%
int outID=-1, outKind=-1, outPrice=-1;
String outName=null, outManuf=null, outImage=null;
DecimalFormat comma = new DecimalFormat("###,###");
String goodID = request.getParameter("goodID");   
Class.forName("oracle.jdbc.driver.OracleDriver");
try {
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url, "test1", "1234");

	Statement stmt = conn.createStatement();
%>
<html>
<title>악기팜</title>
<body>
<%@ include file="./menu.jsp" %>


<table align="center" width="1000">
<tr height="100"><td></td></tr>
<tr height="20">
<td colspan=3><b><font size="5">● 제품상세정보</b></font></td>
</tr>
<%
	ResultSet rs = stmt.executeQuery("SELECT * FROM 상품 WHERE 상품번호=" + goodID);
	if(rs.next()) {
		outImage = rs.getString("이미지");
		outName = rs.getString("상품명");
		outManuf = rs.getString("제조사");
		outPrice = rs.getInt("가격");
	}

%>
<td rowspan=5 width="450"><img src="./images/<%=outImage%>" width=450></td>
<tr height=100><td width=100><font size=4><b>상품명</b></font></td><td width=450><%=outName%></td>
<tr height=100><td width=100><font size=4><b>제조사</b></font></td><td width=450><%=outManuf%></td>
<tr height=100><td width=100><font size=4><b>가격</b></font></td><td width=450><%=comma.format(outPrice)%>원</td>
<tr height=150><td colspan=2 width=450><%if (isLogin == 2) {%>
<a href="./updategood.jsp?goodID=<%=goodID%>">상품수정
<%} else {%>
<a href="./order.jsp?goodID=<%=goodID%>"><font size=5><b>주문하기</b></font>
<%}%></a></td>
<%	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {}
%>
</table>
</body>
</html>-
