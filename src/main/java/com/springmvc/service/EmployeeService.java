package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.model.Employee;
import com.springmvc.repository.Employeerepo;

@Service
public class EmployeeService {

	@Autowired
	private Employeerepo repo;
	
	public Employee add(String name, String email, String contact, String role, int salary) {
		Employee emp=  repo.add(name,email,contact,role,salary);
		return emp;
		
	}
	public Employee search(int id) {
		return repo.search(id);
		
	}
	public Employee delete(int id) {
		
		return repo.delete(id);
	}
	public List<Employee> getallemployees() {
		return repo.getallemployees();
		
	}
	public Employee update(int id,String name,String email,String contact,String role,double salary) {
		return repo.update(id,name,email,contact,role,salary);
	}

}
