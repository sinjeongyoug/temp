package com.sbs.java.blog.dto;

import java.util.Map;

public class Member extends Dto {
	private String updateDate;
	private String loginID;
	private String passward;

	public Member(Map<String, Object> row) {
		super(row);
		this.updateDate = (String) row.get("updateDate");
		this.loginID = (String) row.get("loginID");
		this.passward = (String) row.get("passward");
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public String getPassward() {
		return passward;
	}

	public void setPassward(String passward) {
		this.passward = passward;
	}

	@Override
	public String toString() {
		return "Member [updateDate=" + updateDate + ", loginID=" + loginID + ", passward=" + passward + "]";
	}

	
}
