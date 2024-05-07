<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<html>
<title>로그인</title>
<body>
<%@ include file="./menu.jsp" %>
<table width="400" align="center">
<tr height="100"><td></td></tr>
<tr height="100"><td colspan="2"><font size="6"><b>LOGIN</b></font></td></tr>
<tr height="40" valign="top">
<td width="50" align="center">ID</td>
<td width="350"><form name="Loginform" action="./loginprocess.jsp" method="post"><input type="text" name="idbox" style="width:280px;height:30"></td>
</tr>
<tr height="40" valign="top">
<td width="50" align="center">PW</td>
<td width="350"><input type="password" name="pwbox" style="width:280px;height:30"><input type="submit" style="display:none"></form></td>
</tr>
</table>
<table width="400" align="center">
<tr height="80">
<td width="200" align="center"><a href="./signin.jsp">회원가입</a></td>
<td width="200" align="center"><a href="#" onclick="javacsript:document.Loginform.submit();">로그인</a></td>
</tr>
</table>

</body>
</html>