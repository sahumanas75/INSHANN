package com.inshann.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="PERSONAL_INFORMATION")
public class PersonalInformation
{
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="PERSONAL_ID" )
	@SequenceGenerator(name = "PERSONAL_ID", sequenceName = "PERSONAL_ID", allocationSize = 1)
	@Column(name="PERSONAL_ID")
	private int id;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="LANGUAGE")
	private String language;
	
	@Column(name="ABOUT_YOU",length=1500)
	private String aboutYou;
	
	@Column(name="JOBS")
	private String jobs;
	
	@Column(name="EDUCATIONL_DETAILS")
	private String eduDetails;
	
	@Column(name="INTERNSHIPS")
	private String internships;
	
	@Column(name="EXPERIENCES")
	private String experiences;
	
	@Column(name="WORK_SAMPLE")
	private String workSample;
	
	@Column(name="PROJECTS")
	private String projects;
	
	@Column(name="LINKED_ACCOUNT")
	private String linkedAccount;

	@Column(name="APPLY_STATUS")
	private String applyStatus;
	
	@Column(name="AD_NUMBER")
	private Integer adNumber;
	
	@Column(name="USERNAME")
	private String userName;
	
	
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getAdNumber() {
		return adNumber;
	}

	public void setAdNumber(Integer adNumber) {
		this.adNumber = adNumber;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getAboutYou() {
		return aboutYou;
	}

	public void setAboutYou(String aboutYou) {
		this.aboutYou = aboutYou;
	}

	public String getJobs() {
		return jobs;
	}

	public void setJobs(String jobs) {
		this.jobs = jobs;
	}

	public String getEduDetails() {
		return eduDetails;
	}

	public void setEduDetails(String eduDetails) {
		this.eduDetails = eduDetails;
	}

	public String getInternships() {
		return internships;
	}

	public void setInternships(String internships) {
		this.internships = internships;
	}

	public String getExperiences() {
		return experiences;
	}

	public void setExperiences(String experiences) {
		this.experiences = experiences;
	}

	public String getWorkSample() {
		return workSample;
	}

	public void setWorkSample(String workSample) {
		this.workSample = workSample;
	}

	public String getProjects() {
		return projects;
	}

	public void setProjects(String projects) {
		this.projects = projects;
	}

	public String getLinkedAccount() {
		return linkedAccount;
	}

	public void setLinkedAccount(String linkedAccount) {
		this.linkedAccount = linkedAccount;
	}
	
	
	
}
