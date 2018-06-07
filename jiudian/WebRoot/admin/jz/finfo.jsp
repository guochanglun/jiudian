<%@ page language="java" import="java.util.*,java.util.List" contentType="text/html;charset=gb2312" %> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/>
<%@ page import="org.jfree.chart.*,
org.jfree.chart.plot.PiePlot,
org.jfree.data.general.DefaultPieDataset,
org.jfree.chart.servlet.ServletUtilities,
java.awt.*,
org.jfree.chart.labels.StandardPieSectionLabelGenerator"
%>
<%
//设置数据集
	DefaultPieDataset dataset = new DefaultPieDataset();
String ksj=request.getParameter("ksj"); String esj=request.getParameter("esj");
	 List zyList=cb.getCom("select * from fl order by id desc",2);
 if(!zyList.isEmpty()){
 	for(int i=0;i<zyList.size();i++){
 		List list2=(List)zyList.get(i);
 		int str=cb.getCount("select sum(zj) from rz where fl='"+list2.get(1).toString()+"' and rzsj>='"+ksj+"' and rzsj<='"+esj+"'");
 		dataset.setValue(list2.get(1).toString(),str);
 	}
 }
	 
//通过工厂类生成JFreeChart对象
	JFreeChart chart = ChartFactory.createPieChart3D("营业信息分析图",dataset,true,false,false);
	PiePlot pieplot = (PiePlot)chart.getPlot();
pieplot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0} = {1} = {2}"));
	pieplot.setLabelFont(new Font("宋体",0,12));
//创建主题样式         
StandardChartTheme standardChartTheme=new StandardChartTheme("CN");         
//设置标题字体         
standardChartTheme.setExtraLargeFont(new Font("隶书",Font.BOLD,20));        
 //设置图例的字体         
 standardChartTheme.setRegularFont(new Font("宋书",Font.PLAIN,15));         
 //设置轴向的字体         
 standardChartTheme.setLargeFont(new Font("宋书",Font.PLAIN,15));         
 //应用主题样式         
 ChartFactory.setChartTheme(standardChartTheme);  
	//没有数据的时候显示的内容
	pieplot.setNoDataMessage("无数据显示");
	pieplot.setCircular(false);
	pieplot.setLabelGap(0.02D);
	String filename = ServletUtilities.saveChartAsPNG(chart, 600, 450, null, session);
String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;
%>
<p align=center><img src=" <%=graphURL %>" width=600 height=450 border=0 usemap="# <%=filename%>">