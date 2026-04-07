package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.model.Admin;
import com.springmvc.repository.AdminRepository;

@Service
public class AdminService {
	
	@Autowired
	private AdminRepository repository;

	public Admin addAdmin(String name, String email, String password) {
		return repository.addAdmin(name,email,password);
		
	}

	public Admin login(String email, String password) {
		return repository.login(email,password);
		
	}

}
