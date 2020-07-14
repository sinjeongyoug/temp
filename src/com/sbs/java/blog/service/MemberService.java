package com.sbs.java.blog.service;

import java.sql.Connection;

import com.sbs.java.blog.dao.MemberDao;

public class MemberService extends Service {
	
	private MemberDao memberDao;

	public MemberService(Connection dbConn) {
		memberDao = new MemberDao(dbConn);
	}
	
	
	public int join(String loginID, String password, String email, String name, String nickname) {
		return memberDao.join(loginID, password, email, name, nickname);
	}

}
