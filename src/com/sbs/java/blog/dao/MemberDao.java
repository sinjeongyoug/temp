package com.sbs.java.blog.dao;

import java.sql.Connection;

import com.sbs.java.blog.util.DBUtil;

public class MemberDao {
	
	private Connection dbConn;
	
	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}
	
	public int join(String loginID, String password) {
		String sql = "";

		sql += String.format("INSERT INTO `member` ");
		sql += String.format("SET regDate = NOW()");
		sql += String.format(", updateDate = NOW()");
		sql += String.format(", loginId = '%s'", loginID);
		sql += String.format(", loginPw = '%s'", password);
		sql += String.format(", displayStatus = '1' ");
		
		
		return DBUtil.insert(dbConn, sql);
	}

}
