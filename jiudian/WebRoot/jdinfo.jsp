<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>  
<%
	String id=request.getParameter("id"); if(id==null)id=(String)request.getAttribute("id");
	List list=cb.get1Com("select * from jd where id='"+id+"'",7);	 
%>
<div class="main">
 <div class="narea"><div>
	<img height="126" src="<%=basePath %>images/zgm.jpg" width="1020"> 
</div></div>
<div class="cmain">
  <div class="rmain"> 
      <div class="rdetail">
<div class="rdtitle"><span><%=list.get(1).toString() %></span></div>
<div class="rdmark">
�ͷ����ࣺ<%=list.get(2).toString() %>    �۸�<%=list.get(3).toString() %>    ״̬��<%=list.get(6).toString() %> 
<%if(list.get(6).equals("����")){ %> 
<a href="<%=basePath %>ComServlet?method=jd&jdid=<%=id%>">Ԥ��</a><%} %>
</div>
<div class="rcontent"><center><img src="<%=basePath+list.get(4).toString() %>" border="0" /></center></div>
<div class="rcontent"><%=list.get(5).toString() %></div>
<div class="rlist">  
   <table width="100%" border="0" align="left" cellpadding="4" cellspacing="0" class="rtable">
	  <tbody>
	  <tr class="tr1">
			<td class="rldate daslist">�û�</td>
			<td class="rldate daslist">����</td> 
			<td class="rldate daslist">����</td> 
			<td class="rldate daslist">ʱ��</td>   
         </tr> 
<%    
	List pagelist3 = cb.getCom("select * from rz where mc='"+list.get(1).toString()+"' and pj!='����' order by id desc",16); 
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
%>
	     <tr class="tr<%=(i)%2%>"> 
            <td class="rltitle dotlist"><%=pagelist2.get(12).toString() %></td>  
            <td class="rldate daslist"><%=pagelist2.get(13).toString() %></td> 
            <td class="rldate daslist"><%=pagelist2.get(14).toString() %></td>  
            <td class="rldate daslist"><%=pagelist2.get(4).toString() %></td>  
         </tr> 
<% }} %>        
      </tbody></table>  
</div>
</div> 
</div>
</div>
</div>
<%@ include file="iframe/foot.jsp"%>
