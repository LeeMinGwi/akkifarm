<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"
import = "java.text.DecimalFormat" %>
<%
int outID, outKind, outPrice;
String outName, outManuf, outImage;
DecimalFormat comma = new DecimalFormat("###,###");
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
<td colspan=3><b><font size="5">● 피아노</b></font></td>
</tr>
<tr height="300">
<%
	String strSQL = "SELECT 이미지, 상품번호 FROM 상품 WHERE 분류코드=1 AND 추천=1";
	ResultSet rs = stmt.executeQuery(strSQL);
	int goodid;

	int i = 0;
	while(rs.next() && i < 3) {
		outImage = rs.getString("이미지");
		goodid = rs.getInt("상품번호");
		out.print("<td width=300><a href=\"./detail.jsp?goodID=" + goodid + "\"><img width=290 src=\"./images/" + outImage + "\"></a></td>");
		i++;
	}
%>
</tr><tr height="50">
<%	
	strSQL = "SELECT 상품명 FROM 상품 WHERE 분류코드=1 AND 추천=1";
	rs = stmt.executeQuery(strSQL);
	i=0;
	while(rs.next() && i < 3) {
		outName= rs.getString("상품명");
		out.print("<td align=\"center\" width=300>" + outName + "</td>");
		i++;
	}

%>
</tr><tr height="50">
<%
	strSQL = "SELECT 가격 FROM 상품 WHERE 분류코드=1 AND 추천=1";
	rs = stmt.executeQuery(strSQL);
	i=0;
	while(rs.next() && i < 3) {
		outPrice= rs.getInt("가격");
		out.print("<td align=\"center\" width=300>" + comma.format(outPrice) + "원</td>");
		i++;
	}
%>
</tr>
<tr height="50"><td></td></tr>
<tr height="20">
<td colspan=5><b><font size="5">● 플룻</b></font></td>
</tr>
<tr height="300">
<%
	strSQL = "SELECT 이미지, 상품번호 FROM 상품 WHERE 분류코드=2 AND 추천=1";
	rs = stmt.executeQuery(strSQL);

	i = 0;
	while(rs.next() && i < 3) {
		outImage = rs.getString("이미지");
		goodid = rs.getInt("상품번호");
		out.print("<td width=300><a href=\"./detail.jsp?goodID=" + goodid + "\"><img width=290 src=\"./images/" + outImage + "\"></a></td>");
		i++;
	}
%>
</tr><tr height="50">
<%	
	strSQL = "SELECT 상품명 FROM 상품 WHERE 분류코드=2 AND 추천=1";
	rs = stmt.executeQuery(strSQL);
	i=0;
	while(rs.next() && i < 3) {
		outName= rs.getString("상품명");
		out.print("<td align=\"center\" width=300>" + outName + "</td>");
		i++;
	}

%>
</tr><tr height="50">
<%
	strSQL = "SELECT 가격 FROM 상품 WHERE 분류코드=2 AND 추천=1";
	rs = stmt.executeQuery(strSQL);
	i=0;
	while(rs.next() && i < 3) {
		outPrice= rs.getInt("가격");
		out.print("<td align=\"center\" width=300>" + comma.format(outPrice) + "원</td>");
		i++;
	}
%>
</tr>
<tr height="50"><td></td></tr>
<tr height="20">
<td colspan=5><b><font size="5">● 기타</b></font></td>
</tr>
<tr height="300">
<%
	strSQL = "SELECT 이미지, 상품번호 FROM 상품 WHERE 분류코드=4 AND 추천=1";
	rs = stmt.executeQuery(strSQL);

	i = 0;
	while(rs.next() && i < 3) {
		outImage = rs.getString("이미지");
		goodid = rs.getInt("상품번호");
		out.print("<td width=300><a href=\"./detail.jsp?goodID=" + goodid + "\"><img width=290 src=\"./images/" + outImage + "\"></a></td>");
		i++;
	}
%>
</tr><tr height="50">
<%	
	strSQL = "SELECT 상품명 FROM 상품 WHERE 분류코드=2 AND 추천=1";
	rs = stmt.executeQuery(strSQL);
	i=0;
	while(rs.next() && i < 3) {
		outName= rs.getString("상품명");
		out.print("<td align=\"center\" width=300>" + outName + "</td>");
		i++;
	}

%>
</tr><tr height="50">
<%
	strSQL = "SELECT 가격 FROM 상품 WHERE 분류코드=2 AND 추천=1";
	rs = stmt.executeQuery(strSQL);
	i=0;
	while(rs.next() && i < 3) {
		outPrice= rs.getInt("가격");
		out.print("<td align=\"center\" width=300>" + comma.format(outPrice) + "원</td>");
		i++;
	}
%>
</tr>
<%
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {}
%>
<tr height=200><td></td></tr>
</table>
</body>
</html>