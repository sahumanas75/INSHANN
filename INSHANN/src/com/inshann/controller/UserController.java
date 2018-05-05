package com.inshann.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.inshann.entity.ProvideService;
import com.inshann.entity.Usermanagement;
import com.inshann.service.UserService;
import org.apache.commons.io.FilenameUtils;

@Controller
@RequestMapping("/user")
public class UserController 
{
	@Autowired
	private UserService userService;
	
	@PostMapping(value="/authenticate")
	public String authenticateUser(@ModelAttribute("userDetails") Usermanagement usermanagement,ModelMap map,HttpSession session)
	{
		String userName=usermanagement.getUserName();
		String password=usermanagement.getPassword();
		
		userName=userName.trim();
		
		Usermanagement user=userService.userAuthenticate(userName,password);
		
		if(user!=null)
		{
			if(user.getUserType().equals("PROVIDE SERVICE"))
			{
				session.setAttribute("userName", user.getUserName());
				session.setAttribute("userType", user.getUserType());
				map.put("msg","Hello, "+userName+" is"+" logged In");
				return "provideService";
			}
			else if(user.getUserType().equals("TAKE SERVICE"))
			{
				List<ProvideService> provideService=userService.getAllDetails();
				
				session.setAttribute("userName", user.getUserName());
				session.setAttribute("userType", user.getUserType());
				map.put("provideService", provideService);
				map.put("msg","Hello, "+userName+" is"+" logged In");
				return "postAdShowing";
			}
			
			return "signin";
			
		}
		else
		{
			map.put("username",userName);
			map.put("msg","Invalid Username/Password..!!!");
			return "signin";
		}
		
	}
	
	
	@PostMapping(value="/insertUserDetails")
	public String saveUserDetails(@ModelAttribute("userDetails") Usermanagement usermanagement,ModelMap map,HttpSession session)
	{
		MultipartFile checkType= usermanagement.getScanFile();
		String fileExtentionType =  FilenameUtils.getExtension(checkType.getOriginalFilename());
		String userName=usermanagement.getUserName();
		String emailId=usermanagement.getEmailId();
		String adharNum=usermanagement.getAdharNum();
		
		
		userName=userName.trim();
		emailId=emailId.trim();
		adharNum=adharNum.trim();
		
		usermanagement.setAdharNum(adharNum);
		usermanagement.setEmailId(emailId);
		
		boolean status=userService.checkUsernameExist(userName);
		boolean status1=userService.checkEmailIdExist(emailId);
		boolean status2=userService.checkAadharNumExist(adharNum);
		
		
		if(status==true||status1==true||status2==true)
		{
			if(status==true)
			{
				map.put("msg","Sorry, Username Already Exist..!!!");
				usermanagement.setUserName(userName);
				usermanagement.setEmailId(emailId);
				usermanagement.setAdharNum(adharNum);
				map.put("usermanagement", usermanagement);
				return "signup";
			}
			else if(status1==true)
			{
				map.put("msg","Sorry, Email-id Already Exist..!!!");
				usermanagement.setUserName(userName);
				usermanagement.setEmailId(emailId);
				usermanagement.setAdharNum(adharNum);
				map.put("usermanagement", usermanagement);
				return "signup";
			}
			else if(status2==true)
			{
				map.put("msg","Sorry, Aadhar Number Already Exist..!!!");
				usermanagement.setUserName(userName);
				usermanagement.setEmailId(emailId);
				usermanagement.setAdharNum(adharNum);
				map.put("usermanagement", usermanagement);
				return "signup";
			}
			else
			{
				map.put("msg","Sorry, Something Went Wrong..!!!");
				usermanagement.setUserName(userName);
				usermanagement.setEmailId(emailId);
				usermanagement.setAdharNum(adharNum);
				map.put("usermanagement", usermanagement);
				return "signup";
			}
		}
		
		else if(fileExtentionType.equalsIgnoreCase("jpg")||fileExtentionType.equalsIgnoreCase("png")||
				fileExtentionType.equalsIgnoreCase("jpeg")||fileExtentionType.equalsIgnoreCase("TIF")||fileExtentionType.equalsIgnoreCase("GIF"))
		{
			if(usermanagement.getUserType().equals("PROVIDE SERVICE"))
			{
				try 
				{
					MultipartFile file= usermanagement.getScanFile();
					InputStream inputStream = null;
					OutputStream outputStream = null;
					String fileExtention =  FilenameUtils.getExtension(file.getOriginalFilename());
					inputStream = file.getInputStream();
				
					File dir = new File("E:\\PROFILE");
					dir.mkdir();
					outputStream = new FileOutputStream(new File(dir, userName+"."+fileExtention));
					int readBytes = 0;
					byte[] buffer = new byte[8192];
			
					while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1)
					{	
						outputStream.write(buffer, 0, readBytes);
					}
				
					String userPhoto=userName+"."+fileExtention;
				
					session.setAttribute("userName", usermanagement.getUserName());
					usermanagement.setUserName(userName);
					usermanagement.setUserPhoto(userPhoto);
					userService.createNewUSer(usermanagement);
					map.put("msg","User Created Sucessfully..!!");
				
					outputStream.close();
					inputStream.close();
					return "provideService";
		
				}
				catch (Exception e)
				{
					map.put("msg","Sorry, Something Went Wrong..!!!");
					return "signup";
				}
			}
			
			else if(usermanagement.getUserType().equals("TAKE SERVICE"))
			{
				try 
				{
					MultipartFile file= usermanagement.getScanFile();
					InputStream inputStream = null;
					OutputStream outputStream = null;
					String fileExtention =  FilenameUtils.getExtension(file.getOriginalFilename());
					inputStream = file.getInputStream();
					
					File dir = new File("E:\\PROFILE");
					dir.mkdir();
					outputStream = new FileOutputStream(new File(dir, userName+"."+fileExtention));
					int readBytes = 0;
					byte[] buffer = new byte[8192];
				
					while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1)
					{
						outputStream.write(buffer, 0, readBytes);
					}
					
					String userPhoto=userName+"."+fileExtention;
					
					session.setAttribute("userName", usermanagement.getUserName());
					usermanagement.setUserName(userName);
					usermanagement.setUserPhoto(userPhoto);
					userService.createNewUSer(usermanagement);
					List<ProvideService> provideService=userService.getAllDetails();
					map.put("provideService", provideService);
					map.put("msg","User Created Sucessfully..!!");
					
					outputStream.close();
					inputStream.close();
					return "postAdShowing";
			
				}
				catch (Exception e)
				{
					map.put("msg","Sorry, Something Went Wrong..!!!");
					return "signup";
				}
			}
			else
			{
				map.put("msg","Oops, Something Went Wrong..!!!");
				return "signup";
			}
		}	
					
		else
		{
			Usermanagement usermanagement2=new Usermanagement();
			usermanagement2.setUserName(usermanagement.getUserName());
			usermanagement2.setEmailId(usermanagement.getEmailId());
			usermanagement2.setAdharNum(usermanagement.getAdharNum());
			
			map.put("usermanagement", usermanagement2);
			map.put("msg","Please Select a image type file");
			return "signup";
		}
	}
	
	
	@GetMapping(value="/showForgotPasswordPage")
	public String showForgotPasswordPage(ModelMap map)
	{
		Usermanagement userDetails=new Usermanagement();
		map.addAttribute("userDetails",userDetails);
		
		return "forgotPassword";
	}
	
	@PostMapping(value="/forgotPassword")
	public String forgotPassword(@ModelAttribute("userDetails") Usermanagement usermanagement,ModelMap map)
	{
		String userName=usermanagement.getUserName();
		String password=usermanagement.getPassword();
		String confirmPassword=usermanagement.getConfirmPassword();
		
		userName=userName.trim();
		boolean status=userService.checkUsernameExist(userName);
		
		if(status==true)
		{
			Integer i=userService.updatePassword(userName,password,confirmPassword);
			
			if(i>0)
			{
				map.put("fmsg","Password Sucessfully Changed..!!");
				return "signin";
			}
			else
			{
				map.put("msg","Sorry, Somthing Is Wrong..!!");
				return "forgotPassword";
			}
			
		}
		else
		{
			map.put("msg","Sorry, Username Not Found..!!");
			usermanagement.setUserName(userName);
			map.put("usermanagement", usermanagement);
			return "forgotPassword";
		}
	}
	
	@GetMapping(value="/showSignupPage")
	public String showSignupPage(ModelMap map)
	{
		Usermanagement userDetails=new Usermanagement();
		map.addAttribute("userDetails",userDetails);
		
		return "signup";
	}
	
	@GetMapping(value="/logOut")
    public String logOut(HttpSession session)
    {
		session.invalidate();
		session=null;
   	 	return "signin";
    }
	
}
