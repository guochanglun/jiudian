<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 

<SCRIPT language=javascript>
function login() {
	window.location="login.jsp";
}
</SCRIPT>

<div class="main">
 <div class="narea"><div>
	<img height="126" src="<%=basePath%>images/zgm.jpg" width="1020"> 
</div></div>
<div class="rmain">        
<div class="tom"><div class="totitle"><span> </span></div></div>  
<div class="rlist">  
<FORM name="form1" method="post" action="<%=basePath%>MemberServlet?method=mreg"> 
   <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" class="rtable">
	  <tbody>
	     <tr class="tr1">
            <td class="rldatee daslist"></td>
			<td class="rltitle daslist">&nbsp;&nbsp;&nbsp;&nbsp;�û�ע��</td> 
         </tr>
	     <tr class="tr1">
			<td class="rldatee daslist">��¼�ʺţ�</td>
            <td class="rltitle dotlist"><input type="text" size="30" name="username" required /></td> 
         </tr> 
         <tr class="tr1">
			<td class="rldatee daslist">��¼���룺</td>
            <td class="rltitle dotlist"><input type="password" size="30" name="password" required /></td> 
         </tr>
         <tr class="tr1">
			<td class="rldatee daslist">�û�������</td>
            <td class="rltitle dotlist"><input type="text" size="30" name="realname" required /></td> 
         </tr>
         <tr class="tr1">
			<td class="rldatee daslist">�û��Ա�</td>
            <td class="rltitle dotlist"><input type="radio" name="sex" value="��" checked /> �� <input type="radio" name="sex" value="Ů"/> Ů</td> 
         </tr>
         <tr class="tr1">
			<td class="rldatee daslist">�û����䣺</td>
            <td class="rltitle dotlist"><input type="number" size="30" min="18" name="age" required /></td> 
         </tr>
         <tr class="tr1">
			<td class="rldatee daslist">��ϵ�绰��</td>
            <td class="rltitle dotlist"><input type="text" size="30" name="address" pattern="[0-9]{11}" title="11λ�ֻ�����" required /></td> 
         </tr>
         <tr class="tr1">
			<td class="rldatee daslist">�ܱ����䣺</td>
            <td class="rltitle dotlist"><input type="email" size="30" name="email" required /></td> 
         </tr> 
         <tr class="tr1">
            <td class="rldatee daslist"></td>
			<td class="rltitle daslist"><input type="submit" value="ȷ���ύ" style="width:80px;"/> 
			<input type="button" value="���ص�¼" style="width:80px;" onclick="login()"/></td> 
         </tr> 
      </tbody>
</table> 
</FORM> 
</div>
</div> 
</div>
<%@ include file="iframe/foot.jsp"%>