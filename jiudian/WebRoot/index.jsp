<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>  
<div class="bannerWrap">
<div class="bannerOver"></div>
<div id="slides">
                
<div class="slides_control" style="position: relative; width: 3060px; height: 12px; left: -1020px;">
 
<a style="position: absolute; top: 0px; left: 1020px; z-index: 0; display: none;"><img src="<%=basePath %>images/1.jpg" width=1018 height=265></a> 
<a style="position: absolute; top: 0px; left: 1020px; z-index: 0; display: none;"><img src="<%=basePath %>images/2.jpg" width=1018 height=265></a> 
<a style="position: absolute; top: 0px; left: 1020px; z-index: 0; display: none;"><img src="<%=basePath %>images/3.jpg" width=1018 height=265></a> 
<a style="position: absolute; top: 0px; left: 1020px; z-index: 0; display: none;"><img src="<%=basePath %>images/4.jpg" width=1018 height=265></a> 
</div>							      
                     
</div>  
</div>
 
<div class="main">
<div class="rmain">        
  
    <div class="rlist">  
  
 <table width="100%" height="260" align="center" border="0" cellpadding="0" cellspacing="0">
              <tbody>
             	 <tr>
<%List ttlist=cb.getCom("select * from jd order by id desc limit 4",7);
if(!ttlist.isEmpty()){
for(int i=0;i<ttlist.size();i++){
List list2 =(ArrayList)ttlist.get(i);
%>
                 <td align="center" valign="top" class="listline-dot-4" style="padding:10px 0;">
                  <table width="100%" align="center" height="100" border="0" cellpadding="10" cellspacing="0">
					<tbody>
                    <tr>
                      <td height="200" align="center">
                      <div style="text-align:center;">
                      <div style="text-align:center;">
                      <a href="<%=basePath %>jdinfo.jsp?id=<%=list2.get(0).toString()%>"><img src="<%=basePath+list2.get(4).toString()%>" width="240" height="200" onload=",136(this,200)" style="cursor:hand" border="0"></a>
                      </div>
                      </div>
                      </td>
                    </tr>
                    <tr>
                      <td height="20" align="center"> 
                      <div style="text-align:center; padding:0 10px; line-height:18px;">
                      <a href="<%=basePath %>jdinfo.jsp?id=<%=list2.get(0).toString()%>"><%=list2.get(1).toString()%></a>
                      </div>
                      </td>
                    </tr> 		 
                	</tbody>
               	 </table>
                </td>
<%}} %>
				   
				</tr>  
            </tbody>
            </table>
<table width="100%" height="260" align="center" border="0" cellpadding="0" cellspacing="0">
              <tbody>
             	 <tr>
<%List sttlist=cb.getCom("select * from jd order by id desc limit 8",7);
if(!sttlist.isEmpty()){
for(int i=4;i<sttlist.size();i++){
List list2 =(ArrayList)sttlist.get(i);
%>
                 <td align="center" valign="top" class="listline-dot-4" style="padding:10px 0;">
                  <table width="100%" align="center" height="100" border="0" cellpadding="10" cellspacing="0">
					<tbody>
                    <tr>
                      <td height="200" align="center">
                      <div style="text-align:center;">
                      <div style="text-align:center;">
                      <a href="<%=basePath %>jdinfo.jsp?id=<%=list2.get(0).toString()%>"><img src="<%=basePath+list2.get(4).toString()%>" width="240" height="200" onload=",136(this,200)" style="cursor:hand" border="0"></a>
                      </div>
                      </div>
                      </td>
                    </tr>
                    <tr>
                      <td height="20" align="center"> 
                      <div style="text-align:center; padding:0 10px; line-height:18px;">
                      <a href="<%=basePath %>jdinfo.jsp?id=<%=list2.get(0).toString()%>"><%=list2.get(1).toString()%></a>
                      </div>
                      </td>
                    </tr> 		 
                	</tbody>
               	 </table>
                </td>
<%}} %>
				   
				</tr>  
            </tbody>
            </table>
 </div>
 </div>
 </div>
<%@ include file="iframe/foot.jsp"%>
