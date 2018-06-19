package com.inshann.service;

import java.util.List;

import com.inshann.entity.PersonalInformation;
import com.inshann.entity.ProvideService;
import com.inshann.entity.Usermanagement;

public interface UserService {

	void createNewUSer(Usermanagement usermanagement);

	Usermanagement userAuthenticate(String userName, String password);

	Integer updatePassword(String userName, String password, String confirmPassword);

	void addHireDetails(ProvideService provideService);

	void addPersonalInfo(PersonalInformation personalInformation);

	List<ProvideService> getAllDetails();

	ProvideService getDetailsOfAd(Integer id);

	PersonalInformation getPersonalInfo(String userName);

	boolean checkForApplied(Integer adId, String userName, String checkStatus);

	boolean checkEmailIdExist(String emailId);

	Usermanagement getUserDetails(String userName);

	boolean checkUsernameExist(String userName);

	boolean checkAadharNumExist(String adharNum);
}
