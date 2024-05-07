<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<html>
<title>회원가입</title>
<body>
<%@ include file="./menu.jsp" %>
<table width="800" align="center">
<tr height="80"><td></td></tr>
<tr height="100"><td colspan="3"><font size="6"><b>회원가입</b></font></td></tr>
<tr height="40" valign="top">
<td width="160">이름</td>
<td colspan="2"><form name="Signinform" action="./signinprocess.jsp"><input type="text" name="namebox" style="width:140px;height:30"></td>
</tr>
<tr height="40" valign="top">
<td width="160">아이디</td>
<td width="180"><input type="text" name="idbox" style="width:140px;height:30"></td>
</tr>
<tr height="40" valign="top">
<td width="160">비밀번호</td>
<td colspan="2"><input type="password" name="pw1box" style="width:140px;height:30"></td>
</tr>
<tr height="40" valign="top">
<td width="160">비밀번호 확인</td>
<td colspan="2"><input type="password" name="pw2box" style="width:140px;height:30"></td>
</tr>
<tr height="40" valign="top">
<td width="160">생년월일(8자리 수)</td>
<td colspan="2"><input type="text" name="birthbox" style="width:140px;height:30"></td>
</tr>
<tr height="40" valign="top">
<td width="160">연락처</td>
<td colspan="2"><input type="text" name="pnbox" style="width:140px;height:30"></td>
</tr>
<tr height="40" valign="top">
<td width="160">주소</td>
<td colspan="2"><input type="text" name="addrbox" style="width:600px;height:30"></form></td>
</tr>
</table>
</table>
<table width="400" align="center">
<tr height="80">
<td width="200" align="center"><a href="#" onclick="javacsript:document.Signinform.submit();">회원가입</a></td>
</tr>
</table>

</body>
</html>