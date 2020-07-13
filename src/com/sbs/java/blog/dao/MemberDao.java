package com.sbs.java.blog.dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.util.DBUtil;

@WebServlet("/MemberDao")
public class MemberDao extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public static int join(String loginID, String passward) {
		String sql = "";

		sql += String.format("INSERT INTO article ");
		sql += String.format("SET regDate = NOW() ");
		sql += String.format(", loginID = '%s' ", loginID);
		sql += String.format(", passward = '%s' ", passward);
		sql += String.format(", displayStatus = '1' ");
		
		
		return DBUtil.insert(sql);
	}

}
