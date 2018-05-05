package com.inshann.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.inshann.dao.UserDAO;
import com.inshann.entity.PersonalInformation;
import com.inshann.entity.ProvideService;
import com.inshann.entity.Usermanagement;

@Service
public class UserServiceImpl implements UserService
{
	@Autowired
	private UserDAO userDao;
	

	
	@Override
	@Transactional
	public void createNewUSer(Usermanagement usermanagement)
	{
		 userDao.createNewUSer(usermanagement);
	}

	@Override
	@Transactional
	public Usermanagement userAuthenticate(String userName, String password)
	{
		return userDao.userAuthenticate(userName,password);
	}

	@Override
	@Transactional
	public Integer updatePassword(String userName, String password, String confirmPassword)
	{
		return userDao.updatePassword(userName,password,confirmPassword);
	}

	@Override
	@Transactional
	public void addHireDetails(ProvideService provideService)
	{
		userDao.addHireDetails(provideService);
	}

	@Override
	@Transactional
	public void addPersonalInfo(PersonalInformation personalInformation)
	{
		userDao.addPersonalInfo(personalInformation);
	}

	@Override
	@Transactional
	public List<ProvideService> getAllDetails()
	{
		
		return userDao.getAllDetails();
	}

	@Override
	@Transactional
	public ProvideService getDetailsOfAd(Integer id) {
		return userDao.getDetailsOfAd(id);
	}

	@Override
	@Transactional
	public PersonalInformation getPersonalInfo(String userName) 
	{
		return userDao.getPersonalInfo(userName);
	}

	@Override
	@Transactional
	public boolean checkForApplied(Integer adId, String userName,String checkStatus) 
	{
		return userDao.checkForApplied(adId,userName,checkStatus);
	}

	@Override
	@Transactional
	public Usermanagement getUserDetails(String userName) 
	{
		return userDao.getUserDetails(userName) ;
	}

	@Override
	@Transactional
	public boolean checkEmailIdExist(String emailId)
	{
		return userDao.checkEmailIdExist(emailId);
	}

	@Override
	@Transactional
	public boolean checkUsernameExist(String userName)
	{
		return userDao.checkUsernameExist(userName);
	}

	@Override
	@Transactional
	public boolean checkAadharNumExist(String adharNum)
	{
		return userDao.checkAadharNumExist(adharNum);
	}

}
