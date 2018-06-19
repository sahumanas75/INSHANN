package com.inshann.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.inshann.entity.PersonalInformation;
import com.inshann.entity.ProvideService;
import com.inshann.entity.Usermanagement;
import com.inshann.service.UserService;

@Controller
@RequestMapping("/manageServices")
public class ManageServicesController {
	@Autowired
	UserService userService;

	@PostMapping(value = "/addHireDetails")
	public String addHireDetails(@ModelAttribute("hireDetails") ProvideService provideService, ModelMap map) {
		String des = provideService.getDescription();
		des = des.trim();
		provideService.setDescription(des);
		userService.addHireDetails(provideService);

		map.put("msg", "Your Ad Will Be Displaying Soon..!!!");

		return "successfullAd";
	}

	@PostMapping(value = "/personalInfo")
	public String addPersonalInformation(@ModelAttribute("personal") PersonalInformation personalInformation,
			ModelMap map) {
		userService.addPersonalInfo(personalInformation);
		List<ProvideService> provideService = userService.getAllDetails();
		map.put("provideService", provideService);
		map.put("msg", "Successfully Applied...!!!");
		return "postAdShowing";
	}

	@PostMapping(value = "/showFullDetails")
	public String showApplyingForm(@ModelAttribute("applyingForm") ProvideService provideService, ModelMap map,
			@RequestParam("action") String action, HttpSession session) {
		String userType = (String) session.getAttribute("userType");
		System.out.println(userType);

		if (userType.equals("TAKE SERVICE")) {
			ProvideService pService = userService.getDetailsOfAd(provideService.getId());
			map.put("pService", pService);
			map.put("msg", "");
		} else {
			ProvideService pService = userService.getDetailsOfAd(provideService.getId());
			map.put("pService", pService);
			map.put("msg", "");
		}
		return "hireAdProfile";
	}

	@GetMapping(value = "/homePage")
	public String showHomePage(ModelMap map) {
		List<ProvideService> provideService = userService.getAllDetails();

		map.put("provideService", provideService);
		return "postAdShowing";
	}

	@GetMapping(value = "/envelope")
	public String showEnvelopePage(ModelMap map) {
		map.put("msg", "This Page Is Comingsoon ");
		return "envelope";
	}

	@GetMapping(value = "/send")
	public String showSendPage(ModelMap map) {
		map.put("msg", "This Page Is Comingsoon ");
		return "send";
	}

	@GetMapping(value = "/users")
	public String showUsersPage(ModelMap map, HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		String userName = (String) session.getAttribute("userName");

		Usermanagement usermanagement = userService.getUserDetails(userName);
		PersonalInformation information = userService.getPersonalInfo(userName);

		map.put("usermanagement", usermanagement);
		map.put("information", information);
		return "users";
	}

	@PostMapping(value = "/showPersonalInfoForm")
	public String showPersonalInfo(@ModelAttribute("applyingForm") ProvideService provideService, ModelMap map,
			HttpSession session) {
		Integer adId = provideService.getId();
		String userName = (String) session.getAttribute("userName");
		String checkStatus = "APPLIED";

		boolean status = userService.checkForApplied(adId, userName, checkStatus);

		if (status == true) {
			ProvideService pService = userService.getDetailsOfAd(adId);
			map.put("pService", pService);
			map.put("msg", "Sorry, You already Applied");
			map.put("adNum", adId);
			return "hireAdProfile";
		} else {
			PersonalInformation personalInformation = userService.getPersonalInfo(userName);
			map.put("pInfo", personalInformation);
			map.put("adNum", adId);
			return "personalDetails";
		}
	}

	@GetMapping(value = "/profileImage")
	public String uploadProfileImage(ModelMap map, HttpSession session, HttpServletResponse response) {
		FileInputStream inputStream = null;

		try {
			String userName = (String) session.getAttribute("userName");
			Usermanagement usermanagement = userService.getUserDetails(userName);
			String path = "E:\\PROFILE\\" + usermanagement.getUserPhoto();
			File file = new File(path);
			inputStream = new FileInputStream(file);
			String mimeType = URLConnection.guessContentTypeFromStream(inputStream);

			if (mimeType == null) {
				// set to binary type if MIME mapping not found
				mimeType = "application/octet-stream";
			}

			response.setContentType(mimeType);
			response.setContentLength((int) file.length());

			// get output stream of the response
			OutputStream outStream = response.getOutputStream();
			byte[] buffer = new byte[8192];
			int bytesRead = -1;

			// write bytes read from the input stream into the output stream
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}

			inputStream.close();
			outStream.flush();
			outStream.close();

		} catch (Exception e) {
			e.printStackTrace();
			map.put("pmsg", "Ooops... Something Went Wrong...!!!");
			return "users";
		}

		return null;
	}

	@GetMapping(value = "/backToProvide")
	public String backToProvideService(HttpSession session) {
		String userType = (String) session.getAttribute("userType");

		if (userType.equals("PROVIDE SERVICE")) {
			return "provideService";
		} else {
			return "redirect:/manageServices/homePage";
		}

	}

}
