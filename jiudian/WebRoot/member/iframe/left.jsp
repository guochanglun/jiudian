<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/laydate/laydate.js"></script>
</HEAD>
<%
	String member=(String)session.getAttribute("member");  
	if(member==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
%>
<body>
<div class="left">
     
<script type="text/javascript">
var myMenu;
window.onload = function() {
	myMenu = new SDMenu("my_menu");
	myMenu.init();
};
</script>

<div id="my_menu" class="sdmenu">

	<div class="collapsed">
		<span>������Ϣ����</span>
		<a href="<%=basePath %>member/info/editpwd.jsp" target="MainFrame">������Ϣ����</a> 
	</div>
	
	 
	<div class="collapsed">
		<span>������Ϣ����</span>
		 <a href="<%=basePath %>member/info/index.jsp" target="MainFrame">������Ϣ����</a> 
	</div> 
	
	 
	<div class="collapsed">
		<span>�Ƶ�Ԥ������</span>
		 <a href="<%=basePath %>member/dd/index.jsp" target="MainFrame">�Ƶ�Ԥ������</a> 
		 <a href="<%=basePath %>member/dd/s.jsp" target="MainFrame">�Ƶ�Ԥ����ѯ</a>   
	</div>   
	<div class="collapsed">
		<span>��ס��Ϣ����</span>
		 <a href="<%=basePath %>member/rz/index.jsp" target="MainFrame">��ס��Ϣ����</a> 
		 <a href="<%=basePath %>member/rz/s.jsp" target="MainFrame">��ס��Ϣ��ѯ</a>    
	</div> 
	<div class="collapsed">
		<span>����Ԥ������</span>
		 <a href="<%=basePath %>member/xsdd/index.jsp" target="MainFrame">����Ԥ������</a> 
		 <a href="<%=basePath %>member/xsdd/s.jsp" target="MainFrame">����Ԥ����ѯ</a>   
	</div>     
 	<div class="collapsed">
		<span>ע���˳�ϵͳ</span>
		<a onclick="if (confirm('ȷ��Ҫ�˳���')) return true; else return false;" href="<%=basePath %>MemberServlet?method=memberexit" target="_top" >ע���˳�ϵͳ</a>
	</div> 
</div>
     </div>
     <div class="Switch"></div>
     <script type="text/javascript">
	$(document).ready(function(e) {
    $(".Switch").click(function(){
	$(".left").toggle();
	 
		});
});
</script> 
</body>
<%} %>

</html>
