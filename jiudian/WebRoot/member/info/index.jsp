<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
	
	String member=(String)session.getAttribute("member"); 
	if(member==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
		List mlist=cb.get1Com("select * from member where username='"+member+"'",9);
%>
<body>
<div class="right_cont">
<div class="title_right"><strong>�û���Ϣ����</strong></div>  
<div style="width:900px;margin:auto;">
<form action="<%=basePath %>MemberServlet?method=mupreg" method="post" name="regform">
<table class="table table-bordered"> 
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">�û�������</td>
     <td><input type="text" name="realname" class="span4" value="<%=mlist.get(3).toString() %>" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">�û��Ա�</td>
     <td><input type="radio" name="sex" value="��" checked /> �� <input type="radio" name="sex" value="Ů"/> Ů</td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">�û����䣺</td>
     <td><input type="number" name="age" min="18" class="span4" value="<%=mlist.get(5).toString() %>" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">��ϵ�绰��</td>
     <td><input type="text" name="address" class="span4" value="<%=mlist.get(6).toString() %>" pattern="[0-9]{11}" title="11λ�ֻ�����" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">ע�����䣺</td>
     <td><input type="email" name="email" class="span4" value="<%=mlist.get(7).toString() %>" required/></td> 
     </tr> 
     <tr>
     	<td class="text-center" colspan="2"><input type="submit" value="ȷ���޸�" class="btn btn-info  " style="width:80px;" /></td>
     </tr>
     </table> 
</form>
   </div>  
 </div>  
</body>
<%} %>