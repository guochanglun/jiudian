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
		<span>密码信息管理</span>
		<a href="<%=basePath %>member/info/editpwd.jsp" target="MainFrame">密码信息管理</a> 
	</div>
	
	 
	<div class="collapsed">
		<span>个人信息管理</span>
		 <a href="<%=basePath %>member/info/index.jsp" target="MainFrame">个人信息管理</a> 
	</div> 
	
	 
	<div class="collapsed">
		<span>酒店预定管理</span>
		 <a href="<%=basePath %>member/dd/index.jsp" target="MainFrame">酒店预定管理</a> 
		 <a href="<%=basePath %>member/dd/s.jsp" target="MainFrame">酒店预定查询</a>   
	</div>   
	<div class="collapsed">
		<span>入住信息管理</span>
		 <a href="<%=basePath %>member/rz/index.jsp" target="MainFrame">入住信息管理</a> 
		 <a href="<%=basePath %>member/rz/s.jsp" target="MainFrame">入住信息查询</a>    
	</div> 
	<div class="collapsed">
		<span>餐饮预定管理</span>
		 <a href="<%=basePath %>member/xsdd/index.jsp" target="MainFrame">餐饮预定管理</a> 
		 <a href="<%=basePath %>member/xsdd/s.jsp" target="MainFrame">餐饮预定查询</a>   
	</div>     
 	<div class="collapsed">
		<span>注销退出系统</span>
		<a onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="<%=basePath %>MemberServlet?method=memberexit" target="_top" >注销退出系统</a>
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
