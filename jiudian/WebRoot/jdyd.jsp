<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
<div class="main">
 <div class="narea"><div>
	<img height="126" src="<%=basePath%>images/zgm.jpg" width="1020"> 
</div></div>
<div class="rmain">        
<div class="tom"><div class="totitle"><span> </span></div></div>  
<div class="rlist">  
<%String jdid=(String)request.getAttribute("jdid"); String jg=cb.getString("select jg from jd where id='"+jdid+"'"); %>
<FORM name="form1" method="post" action="<%=basePath %>ComServlet?method=jd2&jdid=<%=jdid%>" >
   <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" class="rtable">
	  <tbody>
	     <tr class="tr1">
            <td class="rldatee daslist">客房价格：</td>
			<td class="rltitle daslist"><%=jg %> 元/天</td> 
         </tr>
         <tr class="tr1">
			<td class="rldatee daslist">入住天数：</td>
            <td class="rltitle dotlist"><input type="number" size="20" min="1" name="sl" required /></td> 
         </tr> 
         <tr class="tr1">
			<td class="rldatee daslist">到店时间：</td>
            <td class="rltitle dotlist"><input type="date" size="20" name="dd" required /></td> 
         </tr> 
         <tr class="tr1">
            <td class="rldatee daslist"></td>
			<td class="rltitle daslist"><input type="submit" value="模拟已支付押金提交预定" style="width:180px;" /></td> 
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
