<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>sinfo.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
    form3.action="<%=basePath%>sinfo.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>sinfo.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%>sinfo.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%>sinfo.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("��ת�ı�����ֻ����������!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//�����ת�ı����������ҳ���������һҳ���������������һҳ
	  if(pageCount==0){	
	  form3.action="<%=basePath%>sinfo.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>sinfo.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//������������0����ô����������1
      form3.action="<%=basePath%>sinfo.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>sinfo.jsp?page="+page;
      form3.submit();
   }

}

}
//****�ж��Ƿ���Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
</script> 
<div class="main">
 <div class="narea"><div>
	<img height="126" src="<%=basePath%>images/zgm.jpg" width="1020"> 
</div></div>
<div class="rmain">        
 
    <div class="rlist">  
   <table width="100%" border="0" align="left" cellpadding="4" cellspacing="0" class="rtable">
	  <tbody>
	  <tr class="tr1">
			<td class="rldate daslist">�ͷ�ͼƬ</td>
			<td class="rldate daslist">�ͷ�����</td>
			<td class="rldate daslist">�ͷ�����</td> 
			<td class="rldate daslist">�ͷ��۸�</td>   
			<td class="rldate daslist">�ͷ�״̬</td>   
         </tr> 
<%  String fl=Common.toChineseAndTrim(request.getParameter("fl"));   
String kje=(request.getParameter("kje"));
String eje=(request.getParameter("eje"));
 
	cb.setEVERYPAGENUM(15);
	int cou = cb.getMessageCount("select count(*) from jd where fl = '"+fl+"' and jg>='"+kje+"' and jg<='"+eje+"' ");//�õ���Ϣ����			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from jd where fl = '"+fl+"' and jg>='"+kje+"' and jg<='"+eje+"' order by id desc",7);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //�õ�ҳ��  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3=(ArrayList)session.getAttribute("qqq");
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
%>
	     <tr class="tr<%=(i)%2%>"> 
	        <td class="rltitle dotlist"><a href="<%=basePath %>jdinfo.jsp?id=<%=pagelist2.get(0).toString()%>"><img src="<%=basePath+pagelist2.get(4).toString() %>" width="100" height="100" border="0" /></a></td> 
            <td class="rltitle dotlist"><a href="<%=basePath %>jdinfo.jsp?id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(1).toString() %></a></td> 
            <td class="rldate daslist"><%=pagelist2.get(2).toString() %></td>  
            <td class="rldate daslist"><%=pagelist2.get(3).toString() %></td>   
            <td class="rldate daslist"><%=pagelist2.get(6).toString() %></td>  
         </tr> 
<% }} %>        
      </tbody></table> 
     <div class="blk15"></div> 
       <div class="rpage">
<form action="" method="post" name="form3">	
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
       <tbody><tr>
            <td align="center">
            <input type="hidden" name="fl" value="<%=fl%>" />  <input type="hidden" name="kje" value="<%=kje%>" /> <input type="hidden" name="eje" value="<%=eje%>" />
<input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//���ڸ�����javascript��ֵ-->
<input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//���ڸ�����javascript��ֵ-->         
		<a href="#" onClick="top2()">��ҳ</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()">��һҳ</a>&nbsp;&nbsp;&nbsp;
		 ��<%=session.getAttribute("busMessageCount").toString()%>����¼,����<%=session.getAttribute("busPageCount").toString()%>ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()">��һҳ</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()">βҳ</a>
	 ��<input name="busjump" type="text" size="3"/>ҳ <a href="#" onClick="bjump2()">ת��</a>
            </td>
          </tr>
      </tbody>
   </table>
</form>
</div> 
</div>
</div> 
</div>
<%@ include file="iframe/foot.jsp"%>
