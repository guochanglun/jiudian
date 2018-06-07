package com.action;
/**
 * 管理员登陆 增加 修改 删除  
 */
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean; 
import com.util.Constant; 

public class AdminServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		try{
			String method=request.getParameter("method").trim();
			ComBean cBean = new ComBean();
			HttpSession session = request.getSession();   
			if(method.equals("one")){//用户登录
				String username = request.getParameter("username");
				String password = request.getParameter("password");  
				//String sf = request.getParameter("sf");   
					String str=cBean.getString("select realname from admin where username='"+username+"' and  password='"+password+"'  ");
					if(str==null){
						request.setAttribute("message", "登录信息错误！");
						request.getRequestDispatcher("login2.jsp").forward(request, response); 
					}
					else{
						session.setAttribute("user", username);  
						request.getRequestDispatcher("admin/index.jsp").forward(request, response); 
					}  
			}
			else if(method.equals("uppwd")){//修改密码
				String username=(String)session.getAttribute("user"); 
				String oldpwd = request.getParameter("oldpwd"); 
				String newpwd = request.getParameter("newpwd"); 
				String str=cBean.getString("select id from admin where username='"+username+"' and  password='"+oldpwd+"'");
				if(str==null){
					request.setAttribute("message", "原始密码信息错误！");
					request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response); 
				}
				else{
					int flag=cBean.comUp("update admin set password='"+newpwd+"' where username='"+username+"'");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response); 
					}
				}
			}
			else if(method.equals("adminexit")){//退出登录
				session.removeAttribute("user");  
				request.getRequestDispatcher("index.jsp").forward(request, response); 
			}
			else if(method.equals("addm")){//增加系统用户
				String username = request.getParameter("username"); 
				String password = request.getParameter("password"); 
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age"); 
				String address = request.getParameter("address"); 
				String tel = request.getParameter("tel");
				String str=cBean.getString("select id from admin where username='"+username+"'");
				if(str==null){ 
					int flag=cBean.comUp("insert into admin(username,password,realname,sex,age,tel,address,addtime) " +
							"values('"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+tel+"','"+address+"','"+date2+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
					} 
				}
				else{
					request.setAttribute("message", "该用户名已存在！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
				} 
			}
			else if(method.equals("upm")){//修改系统用户
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age"); 
				String address = request.getParameter("address"); 
				String tel = request.getParameter("tel"); 
				int flag=cBean.comUp("update admin set password='"+password+"',realname='"+realname+"',sex='"+sex+"',age='"+age+"'," +
						"tel='"+tel+"',address='"+address+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
				}
			}
			else if(method.equals("delm")){//删除系统用户
				String id = request.getParameter("id");  
				int flag=cBean.comUp("delete from admin where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
				}
			} 
			else if(method.equals("upm2")){//修改系统用户
				String username=(String)session.getAttribute("user"); 
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age"); 
				String address = request.getParameter("address"); 
				String tel = request.getParameter("tel"); 
				int flag=cBean.comUp("update admin set realname='"+realname+"',sex='"+sex+"',age='"+age+"'," +
						"tel='"+tel+"',address='"+address+"' where username='"+username+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/system/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/system/index2.jsp").forward(request, response); 
				}
			}
			else{//无参数传入转到错误页面
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
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
