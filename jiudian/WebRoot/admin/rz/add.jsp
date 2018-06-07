<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>  
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
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

<link rel="stylesheet" href="<%=basePath %>editor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=basePath %>editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=basePath %>editor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '<%=basePath %>editor/plugins/code/prettify.css',
				uploadJson : '<%=basePath %>editor/jsp/upload_json.jsp',
				fileManagerJson : '<%=basePath %>editor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
</head>
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
		String method=request.getParameter("method");  
		String id="";String mc="";String xm=""; String sfz=""; String rzsj=""; String yj="";String member="";
		if(method.equals("uprz")){
			id=request.getParameter("id");
			List jlist = cb.get1Com("select * from rz where id='"+id+"'",13);
			mc=jlist.get(1).toString(); 
			xm=jlist.get(2).toString(); 
			sfz=jlist.get(3).toString(); 
			rzsj=jlist.get(4).toString();  
			yj=jlist.get(5).toString();  
			member=jlist.get(12).toString();  
		}	  
%>
<body>
<div class="right_cont">
<div class="title_right"><strong>入住信息管理</strong></div>  
<div style="width:900px;margin:auto;">
<form action="<%=basePath %>ComServlet" method="post" name="form1">
<table class="table table-bordered"> 
     <tr><input type="hidden" name="method" value="<%=method%>"/><input type=hidden name="id" value="<%=id%>"/>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">客房名称：</td>
     <td><select name="mc" required>
    <%if(method.equals("uprz")){ %><option value="<%=mc%>"><%=mc%></option> <%} %> 
    <%List gzlist=cb.getCom("select * from jd order by id asc",2);if(!gzlist.isEmpty()){for(int i=0;i<gzlist.size();i++){List list2=(List)gzlist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></td> 
     </tr>  
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">入住客户：</td>
     <td><input type="text" name="xm" class="span4" value="<%=xm %>" required/></td> 
     </tr> 
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">身份证号码：</td>
     <td><input type="number" name="sfz" class="span4" value="<%=sfz %>" pattern="[0-9]{18}" title="18位身份证号码"  required/></td> 
     </tr> 
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">入住时间：</td>
     <td><input type="date" name="rzsj" class="span3" value="<%=rzsj %>" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">预付押金：</td>
     <td><input type="number" name="yj" min="1" class="span4" value="<%=yj %>" required/></td> 
     </tr> 
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">注册帐号：</td>
     <td><select name="member" required>
    <%if(method.equals("uprz")){ %><option value="<%=member%>"><%=member%></option> <%} %> 
    <%List mlist=cb.getCom("select * from member order by id asc",2);if(!mlist.isEmpty()){for(int i=0;i<mlist.size();i++){List list2=(List)mlist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></td> 
     </tr>
     <tr>
     	<td class="text-center" colspan="2"><input type="submit" value="确定" class="btn btn-info  " style="width:80px;" /></td>
     </tr>
     </table> 
</form>
   </div>  
 </div>  
</body>
<%} %>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>