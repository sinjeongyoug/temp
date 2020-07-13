package com.sbs.java.blog.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.service.ArticleService;
import com.sbs.java.blog.service.MemberService;

public class MemberController extends Controller {

	public MemberController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);
	}

	public void beforeAction() {
		super.beforeAction();
		// 이 메서드는 게시물 컨트롤러의 모든 액션이 실행되기 전에 실행된다.
		// 필요없다면 지워도 된다.
	}

	@Override
	public String doAction() {
		switch (actionMethodName) {
		case "dojoin":
			return doActionDojoin(req, resp);
		case "join":
			return doActionJoin(req, resp);
		}

		return "";
	}

	private String doActionJoin(HttpServletRequest req, HttpServletResponse resp) {
		return "member/join.jsp";
	}

	private String doActionDojoin(HttpServletRequest req, HttpServletResponse resp) {
		String loginID = req.getParameter("loginID");
		String passward = req.getParameter("passward");
		
		int id = MemberService.join(loginID, passward);
		
		return "html:<script> alert('" + id + "회원가입성공.'); location.replace('home'); </script>";
	}

}