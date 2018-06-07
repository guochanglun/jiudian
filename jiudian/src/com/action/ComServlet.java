package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		//String date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("addfl")){  //房间类型   ***********代码注释  
			String mc = request.getParameter("mc");  
			String str=cBean.getString("select id from fl where mc='"+mc+"'");
			if(str==null){
				int flag = cBean.comUp("insert into fl(mc)  values('"+mc+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
				} 
			}
			else{
				request.setAttribute("message", "信息重复");
				request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("delfl")){//删除房间类型
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from fl where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
			}
		} 
		 
		
		else if(method.equals("deljd")){ //删除客房
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from jd where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/jd/index.jsp").forward(request, response);
			}
		} 
		 
		else if(method.equals("jd")){  //客房预定
			String member=(String)session.getAttribute("member");
			String jdid = request.getParameter("jdid");
			String zt=cBean.getString("select zt from jd where id='"+jdid+"'");
			if(zt.equals("空闲")){
				if(member==null){ 
					request.setAttribute("message", "请先登录！");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				else{ 
					request.setAttribute("jdid", jdid);
					request.getRequestDispatcher("jdyd.jsp").forward(request, response);
				} 
			}
			else{
				request.setAttribute("message", "该客房已被预定！");
				request.getRequestDispatcher("jd.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("jd2")){//预定信息
			String ddh=new SimpleDateFormat("yyyyMMddHHmmssSSS").format(Calendar.getInstance().getTime());
			String jdid = request.getParameter("jdid");
			String dd = request.getParameter("dd");
			String member=(String)session.getAttribute("member");
			String sl = request.getParameter("sl");
			String mc= cBean.getString("select mc from jd where id='"+jdid+"'");
			String fl = cBean.getString("select fl from jd where id='"+jdid+"'"); 
			String jg= cBean.getString("select jg from jd where id='"+jdid+"'");
			float zj=Integer.parseInt(sl)*Float.parseFloat(jg);
			int flag = cBean.comUp("insert into dd(jdid,mc,fl,jg,sl,zj,member,sj,dd,ddh)  " +
					"values('"+jdid+"','"+mc+"','"+fl+"','"+jg+"','"+sl+"','"+zj+"','"+member+"','"+date+"','"+dd+"','"+ddh+"')");
			if(flag == Constant.SUCCESS){ 
				//cBean.comUp("update jd set zt='预定' where id='"+jdid+"'");
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}  
		}
		else if(method.equals("qxdd")){ //取消预定
			String id = request.getParameter("id"); 
			String str=cBean.getString("select mc from rz where id='"+id+"' ");
			int flag = cBean.comUp("update dd set qx='已取消' where id='"+id+"'");
			if(flag == Constant.SUCCESS){   
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/dd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/dd/index.jsp").forward(request, response);
			}
		} 
		else if(method.equals("deldd")){ //删客房预定
			String id = request.getParameter("id"); 
			String str=cBean.getString("select mc from rz where id='"+id+"' ");
			int flag = cBean.comUp("delete from dd where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				cBean.comUp("update jd set zt='空闲' where mc='"+str+"'");
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/dd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/dd/index.jsp").forward(request, response);
			}
		} 
		else if(method.equals("deldd2")){ //删客房预定
			String id = request.getParameter("id"); 
			String str=cBean.getString("select mc from rz where id='"+id+"' ");
			int flag = cBean.comUp("delete from dd where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				cBean.comUp("update jd set zt='空闲' where mc='"+str+"'");
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response);
			}
		}  
		
		else if(method.equals("addrz")){  // 入住信息  
			String mc = request.getParameter("mc"); 
			String xm = request.getParameter("xm");  
			String sfz = request.getParameter("sfz");  
			String rzsj = request.getParameter("rzsj");  
			String yj = request.getParameter("yj");  
			String member = request.getParameter("member");  
			String jg = cBean.getString("select jg from jd where mc='"+mc+"' ");
			String fl = cBean.getString("select fl from jd where mc='"+mc+"' ");
			if(member.equals("无")){
				int flag = cBean.comUp("insert into rz(mc,xm,sfz,rzsj,yj,member,jg,fl)  values('"+mc+"','"+xm+"','"+sfz+"','"+rzsj+"','"+yj+"','"+member+"','"+jg+"','"+fl+"'  )");
				if(flag == Constant.SUCCESS){ 
					cBean.comUp("update jd set zt='占用' where mc='"+mc+"'");
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
				} 
			}
			else{
				String str=cBean.getString("select id from member where username='"+member+"' ");
				if(str==null){
					request.setAttribute("message", "无此用户帐号！");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
				}
				else{
					int flag = cBean.comUp("insert into rz(mc,xm,sfz,rzsj,yj,member,jg,fl)  values('"+mc+"','"+xm+"','"+sfz+"','"+rzsj+"','"+yj+"','"+member+"','"+jg+"','"+fl+"'  )");
					if(flag == Constant.SUCCESS){ 
						cBean.comUp("update jd set zt='占用' where mc='"+mc+"'");
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
					}
					else{
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
					} 
				}
			} 
		} 
		else if(method.equals("uprz")){ //修改 入住信息 
			String id=request.getParameter("id");
			String mc = request.getParameter("mc"); 
			String xm = request.getParameter("xm");  
			String sfz = request.getParameter("sfz");  
			String rzsj = request.getParameter("rzsj");  
			String yj = request.getParameter("yj");  
			String member = request.getParameter("member");  
			String jg = cBean.getString("select jg from jd where mc='"+mc+"' ");
			String fl = cBean.getString("select fl from jd where mc='"+mc+"' ");
			String str=cBean.getString("select mc from rz where id='"+id+"' ");
			cBean.comUp("update jd set zt='空闲' where mc='"+str+"'");
			if(member.equals("无")){
				int flag = cBean.comUp("update rz set mc='"+mc+"',xm='"+xm+"',sfz='"+sfz+"',rzsj='"+rzsj+"',yj='"+yj+"',member='"+member+"',jg='"+jg+"',fl='"+fl+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					cBean.comUp("update jd set zt='占用' where mc='"+mc+"'");
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
				}  
			}
			else{
				String strr=cBean.getString("select id from member where username='"+member+"' ");
				if(strr==null){
					request.setAttribute("message", "无此用户帐号！");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
				}
				else{
					int flag = cBean.comUp("update rz set mc='"+mc+"',xm='"+xm+"',sfz='"+sfz+"',rzsj='"+rzsj+"',yj='"+yj+"',member='"+member+"',jg='"+jg+"',fl='"+fl+"' where id='"+id+"'");
					if(flag == Constant.SUCCESS){ 
						cBean.comUp("update jd set zt='占用' where mc='"+mc+"'");
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
					}
					else{
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
					}  
				}
			}
		} 
		else if(method.equals("delrz")){//删除 入住信息
			String id = request.getParameter("id"); 
			String str=cBean.getString("select mc from rz where id='"+id+"' ");
			int flag = cBean.comUp("delete from rz where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				cBean.comUp("update jd set zt='空闲' where mc='"+str+"'");
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
			}
		}  
		else if(method.equals("jz")){ //结账
			String id=request.getParameter("id");
			String ts = request.getParameter("ts");  
			String yj = cBean.getString("select yj from rz where id='"+id+"' ");
			String jg = cBean.getString("select jg from rz where id='"+id+"' ");
			String mc=cBean.getString("select mc from rz where id='"+id+"' "); 
			int zj=Integer.parseInt(ts)*Integer.parseInt(jg);
			int fh=Integer.parseInt(yj)-zj;
				int flag = cBean.comUp("update rz set ts='"+ts+"',zj='"+zj+"',tfsj='"+date+"',fh='"+fh+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					cBean.comUp("update jd set zt='空闲' where mc='"+mc+"'");
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jz/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jz/index.jsp").forward(request, response);
				}  
		} 
		else if(method.equals("upjz")){ //结账
			String id=request.getParameter("id");
			String ts = request.getParameter("ts");  
			String yj = cBean.getString("select yj from rz where id='"+id+"' ");
			String jg = cBean.getString("select jg from rz where id='"+id+"' ");  
			int zj=Integer.parseInt(ts)*Integer.parseInt(jg);
			int fh=Integer.parseInt(yj)-zj;
				int flag = cBean.comUp("update rz set ts='"+ts+"',zj='"+zj+"',tfsj='"+date+"',fh='"+fh+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){  
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jz/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jz/index.jsp").forward(request, response);
				}  
		} 
		
		else if(method.equals("deljz")){//删除结账信息  
			String id = request.getParameter("id");  
			int flag = cBean.comUp("delete from rz where id='"+id+"'");
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/jz/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/jz/index.jsp").forward(request, response);
			}
		}  
		
		else if(method.equals("deljz2")){//删除  
			String id = request.getParameter("id");  
			int flag = cBean.comUp("delete from rz where id='"+id+"'");
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/jz/index2.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/jz/index2.jsp").forward(request, response);
			}
		}  
		
		
		else if(method.equals("shdd")){ //审核预定订单
			String id=request.getParameter("id");
			String sh = request.getParameter("sh");  
			String tz = request.getParameter("tz");  
			String jdid = request.getParameter("jdid");
			int flag = cBean.comUp("update dd set sh='"+sh+"',tz='"+tz+"' where id='"+id+"'");
			if("已通过".equals(sh)){
				cBean.comUp("update jd set zt='预定' where id="+jdid);
			}else{
				cBean.comUp("update jd set zt='空闲' where id="+jdid);
			}
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response);
			}  
		} 
		 
		
		else if(method.equals("delxs")){//删除餐饮
			String id = request.getParameter("id");  
			int flag = cBean.comUp("delete from xs where id='"+id+"'");
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xs/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xs/index.jsp").forward(request, response);
			}
		}  
		
		else if(method.equals("ydxs")){  //餐饮预定
			String member=(String)session.getAttribute("member");
			String xsid = request.getParameter("xsid"); 
			if(member==null){ 
				request.setAttribute("message", "请先登录！");
				request.getRequestDispatcher("xs.jsp").forward(request, response);
			}
			else{ 
				request.setAttribute("xsid", xsid);
				request.getRequestDispatcher("ydxs.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("ydxs2")){//预定餐饮信息
			String ddh=new SimpleDateFormat("yyyyMMddHHmmssSSS").format(Calendar.getInstance().getTime());
			String xsid = request.getParameter("xsid"); 
			String member=(String)session.getAttribute("member");
			String sl = request.getParameter("sl");
			String mc= cBean.getString("select mc from xs where id='"+xsid+"'"); 
			String jg= cBean.getString("select jg from xs where id='"+xsid+"'");
			float zj=Integer.parseInt(sl)*Float.parseFloat(jg);
			int flag = cBean.comUp("insert into xsdd(ddh,xsid,mc,jg,sl,zj,member,sj) values('"+ddh+"','"+xsid+"','"+mc+"','"+jg+"','"+sl+"','"+zj+"','"+member+"','"+date+"' )");
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("xs.jsp").forward(request, response);
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("xs.jsp").forward(request, response);
			}  
		}
		else if(method.equals("delxsdd")){//用户删除餐饮预定
			String id = request.getParameter("id");  
			int flag = cBean.comUp("delete from xsdd where id='"+id+"'");
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/xsdd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/xsdd/index.jsp").forward(request, response);
			}
		}  
		else if(method.equals("delxsdd2")){//管理删除餐饮预定
			String id = request.getParameter("id");  
			int flag = cBean.comUp("delete from xsdd where id='"+id+"'");
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/xsdd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/xsdd/index.jsp").forward(request, response);
			}
		}  
		
		 
		
		else if(method.equals("addpj")){  // 评价反馈   
			String rzid = request.getParameter("rzid"); 
			String pj = request.getParameter("pj"); 
			String py = request.getParameter("py");   
			int flag = cBean.comUp("update rz set pj='"+pj+"',py='"+py+"' where id='"+rzid+"'");
			if(flag == Constant.SUCCESS){   
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/rz/index.jsp").forward(request, response);
			}
			else{ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/rz/index.jsp").forward(request, response);
			}   
		} 
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
