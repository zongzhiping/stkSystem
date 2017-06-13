package com.util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ValueBean {
	
	public static String getTitleByTypeAndId(int id,int type){
		System.out.println(id+"========="+type);
		DBUtil util= new DBUtil();
		Connection conn = util.openConnection();
		ResultSet rs = null;
		String sql="select username from game where id="+id;
		String result="";
		if(type==1){
			sql="select title from dxt where id="+id;
		}else if(type==2){
			sql="select title from ddxt where id="+id;
		}else if(type==3){
			sql="select title from pd where id="+id;
		}else if(type==4){
			sql="select title from bc where id="+id;
		}
		try {
			System.out.println("sql = "+sql);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result=rs.getString("title");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static String getNameByTypeId(int type){
		String result="";
		if(type==1){
			result="单选题";
		}else if(type==2){
			result="多选题";
		}else if(type==3){
			result="判断题";
		}else if(type==4){
			result="填空题";
		}
		return result;
	}
	
	public static String gethave(int type){
		String result="";
		if(type==0){
			
			result="无";
		}else {
			result="有";
		}
		return result;
	}
}
