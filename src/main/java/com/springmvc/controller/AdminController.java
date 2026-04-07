package com.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.model.Admin;
import com.springmvc.service.AdminService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String createAccount(@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("password") String password) {
		 
		Admin admin= service.addAdmin(name,email,password);
		if(admin!=null) {
		return "login";
		}
		return "signup";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("password") String password,
			@RequestParam("email") String email,HttpSession session) {
		
		Admin admin=service.login(email,password);
		if(admin!=null) {
			session.setAttribute("login", admin);
			session.setMaxInactiveInterval(30);
			return "home";
		}
		
		return "login";
		
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}

}
