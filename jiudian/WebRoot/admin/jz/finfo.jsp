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
//�������ݼ�
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
	 
//ͨ������������JFreeChart����
	JFreeChart chart = ChartFactory.createPieChart3D("Ӫҵ��Ϣ����ͼ",dataset,true,false,false);
	PiePlot pieplot = (PiePlot)chart.getPlot();
pieplot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0} = {1} = {2}"));
	pieplot.setLabelFont(new Font("����",0,12));
//����������ʽ         
StandardChartTheme standardChartTheme=new StandardChartTheme("CN");         
//���ñ�������         
standardChartTheme.setExtraLargeFont(new Font("����",Font.BOLD,20));        
 //����ͼ��������         
 standardChartTheme.setRegularFont(new Font("����",Font.PLAIN,15));         
 //�������������         
 standardChartTheme.setLargeFont(new Font("����",Font.PLAIN,15));         
 //Ӧ��������ʽ         
 ChartFactory.setChartTheme(standardChartTheme);  
	//û�����ݵ�ʱ����ʾ������
	pieplot.setNoDataMessage("��������ʾ");
	pieplot.setCircular(false);
	pieplot.setLabelGap(0.02D);
	String filename = ServletUtilities.saveChartAsPNG(chart, 600, 450, null, session);
String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;
%>
<p align=center><img src=" <%=graphURL %>" width=600 height=450 border=0 usemap="# <%=filename%>">