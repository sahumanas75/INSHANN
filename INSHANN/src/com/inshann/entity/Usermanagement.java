package com.inshann.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@Table(name = "USER_DETAILS")
public class Usermanagement implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "USERNAME")
	private String userName;

	@Id
	@Column(name = "EMAIL_ID")
	private String emailId;

	@Id
	@Column(name = "AADHAR_CARD_NUMBER")
	private String adharNum;

	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "CONFIRM_PASSWORD")
	private String confirmPassword;

	@Column(name = "TYPE_OF_USER")
	private String userType;

	@Column(name = "USER_PHOTO")
	private String userPhoto;

	@Transient
	private CommonsMultipartFile scanFile;

	public CommonsMultipartFile getScanFile() {
		return scanFile;
	}

	public void setScanFile(CommonsMultipartFile scanFile) {
		this.scanFile = scanFile;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Usermanagement() {
		// for best practice i took a no-arg constructor
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getAdharNum() {
		return adharNum;
	}

	public void setAdharNum(String adharNum) {
		this.adharNum = adharNum;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

}
