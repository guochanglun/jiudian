<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/laydate/laydate.js"></script>
</head> 
<script language="JavaScript" type="text/javascript">  
var idTmr;  
function  getExplorer() {  
    var explorer = window.navigator.userAgent ;  
    //ie  
    if (explorer.indexOf("MSIE") >= 0) {  
        return 'ie';  
    }  
    //firefox  
    else if (explorer.indexOf("Firefox") >= 0) {  
        return 'Firefox';  
    }  
    //Chrome  
    else if(explorer.indexOf("Chrome") >= 0){  
        return 'Chrome';  
    }  
    //Opera  
    else if(explorer.indexOf("Opera") >= 0){  
        return 'Opera';  
    }  
    //Safari  
    else if(explorer.indexOf("Safari") >= 0){  
        return 'Safari';  
    }  
}  
function method5(tableid) {  
    if(getExplorer()=='ie')  
    {  
        var curTbl = document.getElementById(tableid);  
        var oXL = new ActiveXObject("Excel.Application");  
        var oWB = oXL.Workbooks.Add();  
        var xlsheet = oWB.Worksheets(1);  
        var sel = document.body.createTextRange();  
        sel.moveToElementText(curTbl);  
        sel.select();  
        sel.execCommand("Copy");  
        xlsheet.Paste();  
        oXL.Visible = true;  

        try {  
            var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");  
        } catch (e) {  
            print("Nested catch caught " + e);  
        } finally {  
            oWB.SaveAs(fname);  
            oWB.Close(savechanges = false);  
            oXL.Quit();  
            oXL = null;  
            idTmr = window.setInterval("Cleanup();", 1);  
        }  

    }  
    else  
    {  
        tableToExcel(tableid)  
    }  
}  
function Cleanup() {  
    window.clearInterval(idTmr);  
    CollectGarbage();  
}  
var tableToExcel = (function() {  
    var uri = 'data:application/vnd.ms-excel;base64,',  
            template = '<html><head><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',  
            base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },  
            format = function(s, c) {  
                return s.replace(/{(\w+)}/g,  
                        function(m, p) { return c[p]; }) }  
    return function(table, name) {  
        if (!table.nodeType) table = document.getElementById(table)  
        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}  
        window.location.href = uri + base64(format(template, ctx))  
    }  
})()  
</script>
<script type="text/javascript" src="<%=basePath %>images/jquery1.9.0.min.js"></script>
<script language="javascript" src="<%=basePath %>images/jquery.jqprint-0.3.js"></script>

<script language="javascript">
function  a(){
    $("#ddd").jqprint();
}
</script>
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>admin/xsdd/tinfo.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>admin/xsdd/tinfo.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>admin/xsdd/tinfo.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>admin/xsdd/tinfo.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>admin/xsdd/tinfo.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("跳转文本框中只能输入数字!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
	  if(pageCount==0){	
	  form3.action="<%=basePath%>admin/xsdd/tinfo.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>admin/xsdd/tinfo.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>admin/xsdd/tinfo.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>admin/xsdd/tinfo.jsp?page="+page;
      form3.submit();
   }

}

}
//****判断是否是Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
function del()
{
	pageform.submit();
}
</script>

<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message"); 
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{  
%>
<body>
<div class="right_cont">
<div class="title_right"><strong>餐饮预定统计</strong></div>  
<div style="width:100%;margin:auto;">
<form action="" method="post" name="form3">	
<div id="ddd">
<div id="myDiv">  
<table id="tableExcel" class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td nowrap="nowrap"><strong>序号</strong></td>
         <td nowrap="nowrap"><strong>订单号</strong></td> 
         <td nowrap="nowrap"><strong>餐饮名称</strong></td> 
         <td nowrap="nowrap"><strong>餐饮价格</strong></td> 
         <td nowrap="nowrap"><strong>数量</strong></td> 
         <td nowrap="nowrap"><strong>总价</strong></td>   
         <td nowrap="nowrap"><strong>用户</strong></td>   
         <td nowrap="nowrap"><strong>时间</strong></td>   
       </tr>
<%String ksj=request.getParameter("ksj"); String esj=request.getParameter("esj"); int sum=0;
	cb.setEVERYPAGENUM(12);
	int cou = cb.getMessageCount("select count(*) from xsdd where sj>='"+ksj+"' and sj<='"+esj+"'");//得到信息总数			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from xsdd where sj>='"+ksj+"' and sj<='"+esj+"' order by id desc",9);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //得到页数  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3=(ArrayList)session.getAttribute("qqq");
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
			sum+=Integer.parseInt(pagelist2.get(6).toString());
%>       
       <tr align="center">
         <td nowrap="nowrap"><%=i+1 %></td>
         <td nowrap="nowrap"><%=pagelist2.get(1).toString() %></td>    
         <td nowrap="nowrap"><%=pagelist2.get(3).toString() %></td>   
         <td nowrap="nowrap"><%=pagelist2.get(4).toString() %></td>   
         <td nowrap="nowrap"><%=pagelist2.get(5).toString() %></td>   
         <td nowrap="nowrap"><%=pagelist2.get(6).toString() %></td>  
         <td nowrap="nowrap"><%=pagelist2.get(7).toString() %></td>  
         <td nowrap="nowrap"><%=pagelist2.get(8).toString() %></td>           
       </tr>
<% }} %>
       <tr align="center">
         <td nowrap="nowrap" colspan="22">总计： <%=sum %> 元<input type="hidden" name="ksj" value="<%=ksj%>" /><input type="hidden" name="esj" value="<%=esj%>" />
         <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->
	 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->         
					<a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp;
		 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()">尾页</a>
	 第<input name="busjump" type="text" class="span1" />页 <a href="#" onClick="bjump2()">转到</a>&nbsp;&nbsp;&nbsp; 
         </td>
       </tr>        
     </tbody>
   </table></div> </div> 

<center><input type="button" onclick=" a()" value="打印报表"/> <button type="button" onclick="method5('tableExcel')">导出Excel</button>  </center> 
   </form>
   </div>  
 </div>  
</body>
<%} %>
