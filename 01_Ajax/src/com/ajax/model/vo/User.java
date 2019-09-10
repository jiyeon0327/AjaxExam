package com.ajax.model.vo;

public class User {
	private int userNo; 
	private String userId;
	private String userName;
	private String userAddr;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(int userNo, String userId, String userName, String userAddr) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userAddr = userAddr;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}



	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + ", userAddr=" + userAddr
				+ "]";
	}
	
	
	
}
