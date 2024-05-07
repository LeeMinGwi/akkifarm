<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"
import = "java.text.DecimalFormat" %>
<%
int outID, outKind, outPrice;
String outName, outManuf, outImage;
String category=request.getParameter("category");
String catname=null;
String searchkey="";
DecimalFormat comma = new DecimalFormat("###,###");
Class.forName("oracle.jdbc.driver.OracleDriver");

int this_page = 1;
int minimum = 0, maximum = 0;

if (request.getParameter("page") != null) {
	this_page = Integer.parseInt(request.getParameter("page"));
}

if (request.getParameter("searchkey") != null) {
	searchkey = request.getParameter("searchkey");
}

int contentsbypage = 5;
int numofcontents = 0;
int numofpages = 0;

try {
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url, "test1", "1234");

	Statement stmt = conn.createStatement();
%>
<html>
<title>상품조회</title>
<body>
<%@ include file="./menu.jsp" %>
<table align="center" width="1000">
<tr height="50"><td></td></tr>
<tr height="50"><td align="center" colspan=4>
<form name="searchform" action="./categoryview.jsp" method="get"><input type="submit" style="display:none">
<input type="hidden" name="category" value="<%=category%>"><input type="hidden" name="page" value="<%=this_page%>">
<input type="text" name="searchkey" value="<%=searchkey%>" style="width:700;height:30">&nbsp&nbsp<a href="#" onclick="javacsript:document.searchform.submit();">검색</a></form></td></tr>
<tr height="50">
<%
ResultSet rs = stmt.executeQuery("SELECT * FROM 분류 WHERE 분류코드=" + category);
if (rs.next()) {
	catname=rs.getString("분류명");
}
%>
<td colspan=4><b><font size="5">● <%=catname%></b></font></td>
</tr>
<tr height="30">
<td align="center" width="200"><font size=4><b>상품 사진</b></font></td>
<td align="center" width="550"><font size=4><b>품명</b></font></td>
<td align="center" width="150"><font size=4><b>제조사</b></font></td>
<td align="center" width="100"><font size=4><b>가격</b></font></td>
<%
	if(searchkey.equals("")) {
		rs = stmt.executeQuery("SELECT COUNT(*) FROM 상품 WHERE 분류코드=" + category);
	} else {
		rs = stmt.executeQuery("SELECT COUNT(*) FROM 상품 WHERE 분류코드=" + category + "AND 상품명 LIKE \'%" + searchkey + "%\'");
	}
	if (rs.next()) {
		numofcontents = rs.getInt(1);
		numofpages = (numofcontents - 1) / contentsbypage + 1;
	}
	
	if(this_page > numofpages || this_page <=0) this_page = 1;
	minimum = this_page * contentsbypage - 4;
	maximum = this_page * contentsbypage;
	int countofcontents = 0;
	
	if(searchkey.equals("")) {
		rs = stmt.executeQuery("SELECT * FROM 상품 WHERE 분류코드=" + category);
	} else {
		rs = stmt.executeQuery("SELECT * FROM 상품 WHERE 분류코드=" + category + "AND 상품명 LIKE \'%" + searchkey + "%\'");
	}

	while(rs.next()) {
		countofcontents++;
		if(countofcontents < minimum || countofcontents > maximum) continue;
		outID = rs.getInt("상품번호");
		outImage = rs.getString("이미지");
		outName = rs.getString("상품명");
		outManuf = rs.getString("제조사");
		outPrice = rs.getInt("가격");
		%>
<tr height=200><td width=200><a href="./detail.jsp?goodID=<%=outID%>"><img width=200 src="./images/<%=outImage%>"></a></td>
<td width=550 align="center"><a href="./detail.jsp?goodID=<%=outID%>"><%=outName%></a></td>
<td width=150 align="center"><%=outManuf%></td><td width=100 align="center"><%=comma.format(outPrice)%>원</td></tr>
<%
	}
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {}
%>
</tr>
<tr height=60 valign="top"><td></td></tr>
<tr height=200 valign="top"><td colspan=4 align="center">
<a href="categoryview.jsp?category=<%=category%>&page=1&searchkey=<%=searchkey%>"><<</a>&nbsp;
<% if(this_page <= 1){ %> <&nbsp; 
<% } else { %>  
     <a href="categoryview.jsp?category=<%=category%>&page=<%=this_page-1 %>&searchkey=<%=searchkey%>"><</a>&nbsp;
<% } %>

<% for(int i=1; i<=numofpages ; i++){ %>
<% if(this_page == i){ %> <%=i %> &nbsp; 
<% } else { %>  
     <a href="categoryview.jsp?category=<%=category%>&page=<%=i %>&searchkey=<%=searchkey%>"><%=i %></a>&nbsp;
<% } %>
<% } %>

<% if(this_page >= numofpages){ %> > &nbsp;
<% } else { %>  
     <a href="categoryview.jsp?category=<%=category%>&page=<%=this_page+1 %>&searchkey=<%=searchkey%>">></a>&nbsp;
<% } %>
<a href="categoryview.jsp?category=<%=category%>&page=<%=numofpages %>&searchkey=<%=searchkey%>">>></a>
</td></tr>
</table>
</html>