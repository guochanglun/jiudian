<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
<div class="main">
 <div class="narea"><div>
	<img height="126" src="<%=basePath%>images/zgm.jpg" width="1020"> 
</div></div>
<div class="rmain">        
<div class="tom"><div class="totitle"><span> </span></div></div>  
<div class="rlist">  
<FORM name="form1" method="post" action="<%=basePath %>sinfo.jsp" >
   <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" class="rtable">
	  <tbody>
	     <tr class="tr1">
            <td class="rldatee daslist"></td>
			<td class="rltitle daslist">&nbsp;</td> 
         </tr>
         <tr class="tr1">
			<td class="rldatee daslist">客房类型：</td>
            <td class="rltitle dotlist"><select name="fl" required> 
    <%List flist=cb.getCom("select * from fl order by id asc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></td> 
         </tr>  
         <tr class="tr1">
			<td class="rldatee daslist">客房预算：</td>
            <td class="rltitle dotlist"><input type="number" size="10" name="kje" required /> -  <input type="number" size="10" name="eje" required /></td> 
         </tr> 
         <tr class="tr1">
            <td class="rldatee daslist"></td>
			<td class="rltitle daslist"><input type="submit" value="查询" style="width:80px;" /></td> 
         </tr>
         
      </tbody>
</table> 
</FORM> 
 
 
  
</div>
</div> 
</div>
<%@ include file="iframe/foot.jsp"%>
