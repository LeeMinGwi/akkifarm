<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<%
String currentID = (String)session.getAttribute("currentID");
String currentName = (String)session.getAttribute("currentName");
int isLogin = 0; //0이면 로그아웃, 1이면 회원, 2이면 관리자 로그인 상태
if (currentID != null) {
	if (currentID.equals("administrator")) {
		isLogin = 2;
	} else {
		isLogin = 1;
	}
}
%>
<html>
<head>
<style type="text/css">
color: #111111;
font-family: 돋움, Arial;
a:visited { color:#111111; }
a:link { color:#111111;  }
a:hover { color:#111111;  }

</style>
</head>
<body>
<table align="center" width="1200">
<tr height="10">
<% if (isLogin == 0) {
	out.print("<td colspan=5 align=\"right\"><a href=\"./login.jsp\">로그인</a></td>");
} else if (isLogin == 1) {
	out.print("<td colspan=3></td><td align=\"right\">"+currentName+"님</td>");
	out.print("<td><a href=\"./logout.jsp\">로그아웃</a>");
	out.print("     <a href=\"./memberinfo.jsp\">회원정보</a></td>");
} else if (isLogin == 2) {
	out.print("<td colspan=3></td><td align=\"right\">"+currentName+"님</td>");
	out.print("<td><a href=\"./logout.jsp\">로그아웃</a>");
	out.print("     <a href=\"./reggood.jsp\">상품등록</a></td>");
}%>
<tr height="120">
<td colspan="5" align="center"><a href="./main.jsp"><img width=300 src="./images/banner.jpg"</a></td>
</tr>
<tr align="center">
<td width="240"><a href="./categoryview.jsp?category=1"><font size=5><b>피아노</b></font></a></td>
<td width="240"><a href="./categoryview.jsp?category=2"><font size=5><b>플룻</b></font></a></td>
<td width="240"><a href="./categoryview.jsp?category=3"><font size=5><b>바이올린</b></font></a></td>
<td width="240"><a href="./categoryview.jsp?category=4"><font size=5><b>기타</b></font></a></td>
<td width="240"><a href="./categoryview.jsp?category=5"><font size=5><b>드럼</b></font></a></td>
</tr>
</table>
</body>
</html>