<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
<div class="main">
 <div class="narea"><div>
	<img height="126" src="<%=basePath%>images/zgm.jpg" width="1020"> 
</div></div>
<div class="rmain">        
<div class="tom"><div class="totitle"><span> </span></div></div>  
<div class="rlist">  
<%String xsid=(String)request.getAttribute("xsid"); String jg=cb.getString("select jg from xs where id='"+xsid+"'"); %>
<FORM name="form1" method="post" action="<%=basePath %>ComServlet?method=ydxs2&xsid=<%=xsid%>" >
   <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" class="rtable">
	  <tbody>
	     <tr class="tr1">
            <td class="rldatee daslist">�����۸�</td>
			<td class="rltitle daslist"><%=jg %> Ԫ</td> 
         </tr>
         <tr class="tr1">
			<td class="rldatee daslist">����������</td>
            <td class="rltitle dotlist"><input type="number" size="20" min="1" name="sl" required /></td> 
         </tr>  
         <tr class="tr1">
            <td class="rldatee daslist"></td>
			<td class="rltitle daslist"><input type="submit" value="ģ����֧��Ѻ���ύԤ��" style="width:180px;" /></td> 
         </tr>
         <tr class="tr1">
            <td class="rldatee daslist"></td>
			<td class="rltitle daslist">&nbsp;</td> 
         </tr> 
      </tbody>
</table> 
</FORM> 
 
</div>
</div> 
</div>
<%@ include file="iframe/foot.jsp"%>
