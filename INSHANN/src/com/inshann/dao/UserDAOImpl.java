package com.inshann.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inshann.entity.PersonalInformation;
import com.inshann.entity.ProvideService;
import com.inshann.entity.Usermanagement;

@Repository
public class UserDAOImpl implements UserDAO {
	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean checkEmailIdExist(String emailId) {
		boolean status;

		// first get the current session
		Session currentSession = sessionFactory.getCurrentSession();

		Query<Usermanagement> theQuery = currentSession.createQuery("from Usermanagement us where  us.emailId=:emailId",
				Usermanagement.class);
		theQuery.setParameter("emailId", emailId);

		try {
			Usermanagement user = theQuery.uniqueResult();
			if (user != null) {
				status = true;
				return status;
			} else {
				status = false;
				return status;
			}

		} catch (Exception e) {
			return false;
		}

	}

	@Override
	public void createNewUSer(Usermanagement usermanagement) {
		// first get the current session
		Session currentSession = sessionFactory.getCurrentSession();

		// save or update the customer
		currentSession.saveOrUpdate(usermanagement);

	}

	@Override
	public Usermanagement userAuthenticate(String userName, String password) {

		// first get the current session
		Session currentSession = sessionFactory.getCurrentSession();

		Query<Usermanagement> theQuery = currentSession.createQuery(
				"from Usermanagement us WHERE us.userName=:userName AND us.password=:password", Usermanagement.class);
		theQuery.setParameter("userName", userName);
		theQuery.setParameter("password", password);

		Usermanagement user = theQuery.uniqueResult();
		try {
			if (user != null) {
				return user;
			} else {
				return user = null;
			}
		} catch (Exception e) {
			return user = null;
		}

	}

	@Override
	public Integer updatePassword(String userName, String password, String confirmPassword) {
		// first get the current session
		Session currentSession = sessionFactory.getCurrentSession();

		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery(
				"UPDATE Usermanagement  set password=:password,confirmPassword=:confirmPassword WHERE userName=:userName");
		theQuery.setParameter("userName", userName);
		theQuery.setParameter("password", password);
		theQuery.setParameter("confirmPassword", confirmPassword);

		Integer i = theQuery.executeUpdate();

		return i;

	}

	@Override
	public void addHireDetails(ProvideService provideService) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(provideService);
	}

	@Override
	public void addPersonalInfo(PersonalInformation personalInformation) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(personalInformation);
	}

	@Override
	public List<ProvideService> getAllDetails() {
		Session currentSession = sessionFactory.getCurrentSession();

		Query<ProvideService> theQuery = currentSession.createQuery("from ProvideService", ProvideService.class);

		List<ProvideService> list = theQuery.getResultList();

		return list;
	}

	@Override
	public ProvideService getDetailsOfAd(Integer id) {
		Session currentSession = sessionFactory.getCurrentSession();

		Query<ProvideService> theQuery = currentSession.createQuery("from ProvideService where id=:id",
				ProvideService.class);
		theQuery.setParameter("id", id);
		ProvideService provideService = theQuery.uniqueResult();

		return provideService;
	}

	@Override
	public PersonalInformation getPersonalInfo(String userName) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<PersonalInformation> theQuery = currentSession
				.createQuery("from PersonalInformation where userName=:userName", PersonalInformation.class);
		theQuery.setParameter("userName", userName);
		try {
			PersonalInformation personalInformation = theQuery.list().get(0);
			if (personalInformation != null) {
				return personalInformation;
			} else {
				return personalInformation = new PersonalInformation();
			}
		} catch (Exception e) {
			PersonalInformation personalInformation = null;
			return personalInformation;
		}

	}

	@Override
	public boolean checkForApplied(Integer adId, String userName, String checkStatus) {
		boolean status;
		Session currentSession = sessionFactory.getCurrentSession();
		Query<PersonalInformation> theQuery = currentSession
				.createQuery("from PersonalInformation where adNumber=:adId AND userName=:userName AND "
						+ " applyStatus=:checkStatus", PersonalInformation.class);
		theQuery.setParameter("adId", adId);
		theQuery.setParameter("userName", userName);
		theQuery.setParameter("checkStatus", checkStatus);
		try {
			PersonalInformation personalInformation = theQuery.uniqueResult();
			if (personalInformation != null) {
				status = true;
				return status;
			} else {
				status = false;
				return status;
			}
		} catch (Exception e) {
			status = false;
			return status;
		}
	}

	@Override
	public Usermanagement getUserDetails(String userName) {
		Session currentSession = sessionFactory.getCurrentSession();

		Query<Usermanagement> theQuery = currentSession.createQuery("from Usermanagement where userName=:userName",
				Usermanagement.class);
		theQuery.setParameter("userName", userName);
		Usermanagement usermanagement = theQuery.uniqueResult();
		return usermanagement;
	}

	@Override
	public boolean checkUsernameExist(String userName) {
		boolean status;

		// first get the current session
		Session currentSession = sessionFactory.getCurrentSession();

		Query<Usermanagement> theQuery = currentSession
				.createQuery("from Usermanagement us where us.userName=:userName", Usermanagement.class);
		theQuery.setParameter("userName", userName);

		try {
			Usermanagement user = theQuery.uniqueResult();
			if (user != null) {
				status = true;
			} else {
				status = false;
			}

			return status;
		} catch (Exception e) {
			return false;
		}

	}

	@Override
	public boolean checkAadharNumExist(String adharNum) {
		boolean status;

		// first get the current session
		Session currentSession = sessionFactory.getCurrentSession();

		Query<Usermanagement> theQuery = currentSession
				.createQuery("from Usermanagement us where  us.adharNum=:adharNum", Usermanagement.class);
		theQuery.setParameter("adharNum", adharNum);

		try {
			Usermanagement user = theQuery.uniqueResult();
			if (user != null) {
				status = true;
			} else {
				status = false;
			}

			return status;
		} catch (Exception e) {
			return false;
		}
	}

}
