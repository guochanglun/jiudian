package com.util;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.activation.DataSource;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;

/**
 * 连接数据库
 *
 */
public class DBO {

	private Connection conn;
	private Statement stmt;
  	private DataSource ds;
	
	public DBO()
	{
	}

	/**
		打开数据库
	*/
	public void open() 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			conn=DriverManager.getConnection("jdbc:mysql://localhost/jiudian?useUnicode=true&characterEncoding=gb2312","root","root"); 
			stmt=conn.createStatement();
			System.out.println("打开数据库连接");
		} 
		catch (Exception ex) 
		{
		System.err.println("打开数据库时出错: " + ex.getMessage());
		}
	}

	/**
		关闭数据库，将连接返还给连接池
	*/
	public void close() 
	{
		try 
		{
		
				
		//	connMgr.freeConnection("java", conn);
			conn.close();
			System.out.println ("释放连接");
		} 
		catch (SQLException ex) 
		{
			System.err.println("返还连接池出错: " + ex.getMessage());
		}
	}

	/**
		执行查询
	*/
	public ResultSet executeQuery(String sql) throws SQLException
	{
		ResultSet rs = null;
		
		// 执行sql语句，sql比如：select * from xxx
		rs = stmt.executeQuery(sql);
		System.out.println ("执行查询");
		return rs;
	}

	/**
		执行增删改
	*/
	public int executeUpdate(String sql) throws SQLException
	{
		int ret = 0;
		
		// 可以用来执行增删改
		ret = stmt.executeUpdate(sql);
	
		System.out.println ("执行增删改");
		return ret;
	}

	/**
		将SQL语句加入到批处理
	*/
	public void addBatch(String sql) throws SQLException 
	{
		stmt.addBatch(sql);
	}

	/**
		执行批处理
	*/
	public int [] executeBatch() throws SQLException 
	{
		boolean isAuto=conn.getAutoCommit();
		
		// 设置不自动提交事务
		conn.setAutoCommit(false);
		int [] updateCounts = stmt.executeBatch();
		return updateCounts;
	}
	
	// 获取是否自动提交事务
	public boolean getAutoCommit() throws SQLException
	{
		return conn.getAutoCommit();
	}
	
	public void setAutoCommit(boolean auto)  throws SQLException 
	{
		conn.setAutoCommit(auto);
	}
	
	public void commit() throws SQLException 
	{
		conn.commit();
	}
	
	// 回滚事务
	public void rollBack() throws SQLException 
	{
		conn.rollback();
	}
	
}
