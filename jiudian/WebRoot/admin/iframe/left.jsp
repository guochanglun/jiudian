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
	String username=(String)session.getAttribute("user");  
	if(username==null){
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
		<a href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">������Ϣ����</a> 
	</div>
	 
	 
	<div class="collapsed">
		<span>������Ϣ����</span>
		 <a href="<%=basePath %>admin/xs/index.jsp" target="MainFrame">������Ϣ����</a> 
		 <a href="<%=basePath %>admin/xs/add.jsp?method=addxs" target="MainFrame">���Ӳ�����Ϣ</a>  
		 <a href="<%=basePath %>admin/xs/s.jsp" target="MainFrame">������Ϣ��ѯ</a> 
	</div>
	<div class="collapsed">
		<span>ע���û�����</span>
		<a href="<%=basePath %>admin/member/index.jsp" target="MainFrame">ע���û�����</a> 
		<a href="<%=basePath %>admin/member/s.jsp" target="MainFrame">ע���û���ѯ</a> 
	</div>  
	<div class="collapsed">
		<span>�������͹���</span>
		<a href="<%=basePath %>admin/fl/index.jsp" target="MainFrame">�������͹���</a> 
		<a href="<%=basePath %>admin/fl/add.jsp?method=addfl" target="MainFrame">���ӷ�������</a> 
	</div>
	<div class="collapsed">
		<span>�ͷ���Ϣ����</span>
		 <a href="<%=basePath %>admin/jd/index.jsp" target="MainFrame">�ͷ���Ϣ����</a> 
		 <a href="<%=basePath %>admin/jd/add.jsp?method=addjd" target="MainFrame">���ӿͷ���Ϣ</a>  
		 <a href="<%=basePath %>admin/jd/s.jsp" target="MainFrame">�ͷ���Ϣ��ѯ</a> 
	</div>
	 
	 
	<div class="collapsed">
		<span>�ͷ�Ԥ������</span>
		<a href="<%=basePath %>admin/dd/index.jsp" target="MainFrame">�ͷ�Ԥ������</a>  
		 <a href="<%=basePath %>admin/dd/s.jsp" target="MainFrame">�ͷ�Ԥ����ѯ</a>   
	</div> 
	
	<div class="collapsed">
		<span>��ס��Ϣ����</span>
		 <a href="<%=basePath %>admin/rz/index.jsp" target="MainFrame">��ס��Ϣ����</a> 
		 <a href="<%=basePath %>admin/rz/add.jsp?method=addrz" target="MainFrame">������ס��Ϣ</a>  
		 <a href="<%=basePath %>admin/rz/s.jsp" target="MainFrame">��ס��Ϣ��ѯ</a> 
	</div>
	<div class="collapsed">
		<span>������Ϣ����</span>
		<a href="<%=basePath %>admin/jz/index.jsp" target="MainFrame">������Ϣ����</a> 
		<a href="<%=basePath %>admin/jz/add.jsp?method=addjz" target="MainFrame">���ӽ�����Ϣ</a> 
		<a href="<%=basePath %>admin/jz/s.jsp" target="MainFrame">������Ϣ��ѯ</a>  
	</div> 
 	<div class="collapsed">
		<span>��ʷ��Ϣ����</span>
		<a href="<%=basePath %>admin/jz/index2.jsp" target="MainFrame">��ʷ��Ϣ����</a>  
		<a href="<%=basePath %>admin/jz/s2.jsp" target="MainFrame">��ʷ��Ϣ��ѯ</a>  
	</div>
	<div class="collapsed">
		<span>��Ϣͳ�Ʋ�ѯ</span>
		<a href="<%=basePath %>admin/jz/t.jsp" target="MainFrame">Ӫҵ��Ϣͳ��</a>  
		<a href="<%=basePath %>admin/jz/f.jsp" target="MainFrame">Ӫҵ��Ϣ����</a>  
	</div> 
	<div class="collapsed">
		<span>����Ԥ������</span>
		<a href="<%=basePath %>admin/xsdd/index.jsp" target="MainFrame">����Ԥ������</a>  
		<a href="<%=basePath %>admin/xsdd/s.jsp" target="MainFrame">����Ԥ����ѯ</a>
		<a href="<%=basePath %>admin/xsdd/t.jsp" target="MainFrame">����Ԥ��ͳ��</a>   
	</div> 
 	<div class="collapsed">
		<span>ע���˳�ϵͳ</span>
		<a onclick="if (confirm('ȷ��Ҫ�˳���')) return true; else return false;" href="<%=basePath %>AdminServlet?method=adminexit" target="_top" >ע���˳�ϵͳ</a>
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
