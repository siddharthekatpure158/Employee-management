package com.springmvc.controller;

import java.net.http.HttpRequest;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.springmvc.model.Admin;
import com.springmvc.model.Employee;
import com.springmvc.service.EmployeeService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class EmployeeContoller {
	
	@Autowired
	private EmployeeService service;
	
	@GetMapping("/home")
	public String home(@SessionAttribute(name="login",required=false) Admin admin) {
		if(admin!=null) {
			return "home";
		}
		return "login";
	}
	
	@GetMapping("/add")
	public String add(@SessionAttribute(name="login",required=false) Admin admin) {
		if(admin!=null) {
			return "add";
		}
		return "login";
	}
	
	@PostMapping("/addEmployee")
    public String addEmployee(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("contact") String contact,
            @RequestParam("role") String role,
            @RequestParam("salary") int salary,
            ModelMap map
    ) {

		Employee emp=service.add(name, email, contact, role, salary);
		
		if(emp!=null) {
			map.addAttribute("msg","Employee Added Succesfully");
			return "add";
		}
        map.addAttribute("msg","Employee not added");

        return "add";
    }
	
	@GetMapping("/search")
	public String search(@SessionAttribute(name="login",required=false) Admin admin) {
		if(admin!=null) {
			return "search";
		}
		return "login";
	}
	
	@PostMapping("/searchemp")
	public String searchemp( @RequestParam("id") int id,ModelMap map ) {
		
		Employee emp=service.search(id);
		if(emp!=null) {
			map.addAttribute("msg","Employee founded");
			map.addAttribute("emp",emp);
			return "search";
		}
		
		map.addAttribute("msg","Employee Not Founded");
		map.addAttribute("emp",null);
		return "search";
		
	}	
	@GetMapping("/delete")
	public String delete(ModelMap map,@SessionAttribute(name="login",required=false) Admin admin ) {
		if(admin!=null) {
			List<Employee> emps=service.getallemployees();
			if(!emps.isEmpty()) {
				map.addAttribute("emps",emps);
				map.addAttribute("msg", "Current Employees");
				return "delete";
			}
			map.addAttribute("emps",null);
			map.addAttribute("msg", "No employees found");
			return "delete";
		}
		return "login";
	}
	
	@PostMapping("/deleteemp")
	public String deletemp(@RequestParam("id") int id, ModelMap map) {

		Employee emp = service.delete(id);

		List<Employee> emps = service.getallemployees();
		map.addAttribute("emps", emps);

		if (emp != null) {
		    map.addAttribute("msg2", "Employee Deleted Successfully");
		} else {
		    map.addAttribute("msg2", "Employee Not Found");
		}

		return "delete";
	}
	
	@GetMapping("/update")
	public String update(@SessionAttribute(name="login",required=false) Admin admin) {
		if(admin!=null) {
			return "update";
		}
		return "login";
	}
	@PostMapping("/updateemp")
	public String updateemp( @RequestParam("id") int id,ModelMap map ) {
		
		Employee emp=service.search(id);
		if(emp!=null) {
			map.addAttribute("msg","Employee founded");
			map.addAttribute("emp",emp);
			return "update";
		}
		
		map.addAttribute("msg","Employee Not Founded");
		map.addAttribute("emp",null);
		return "update";
		
	}	
	
	@PostMapping("/updateemp2")
	public String updateemp2(@RequestParam("id") int id,@RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("contact") String contact,
            @RequestParam("role") String role,
            @RequestParam("salary") double salary,
            ModelMap map ) {
		
		Employee emp=service.update(id,name,email,contact,role,salary);
		
		if(emp!=null) {
			map.addAttribute("msg2","Employee Updated Succesfully");
			return "update";
		}
		
		return "update";
	}	
	
	
	
	
	
}
