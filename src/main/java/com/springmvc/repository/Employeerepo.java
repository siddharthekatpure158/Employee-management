package com.springmvc.repository;



import java.util.List;

import org.springframework.stereotype.Repository;


import com.springmvc.model.Employee;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

@Repository
public class Employeerepo {
	
	private static EntityManagerFactory factory;
    private static EntityManager manager;
    private static EntityTransaction transaction;

	
	public static void openconnection() {
		factory = Persistence.createEntityManagerFactory("springmvc");
        manager = factory.createEntityManager();
        transaction = manager.getTransaction();
    }

    public static void closeconnection() {

        if (transaction != null && transaction.isActive()) {
            transaction.rollback();
        }

        if (manager != null) {
            manager.close();
        }

        if (factory != null) {
            factory.close();
        }
    }
	
	public Employee add(String name, String email, String contact, String role, int salary) {
		openconnection();
		transaction.begin();
		Employee emp=new Employee();
		emp.setContact(contact);
		emp.setEmail(email);
		emp.setName(name);
		emp.setRole(role);
		emp.setSalary(salary);
		manager.persist(emp);
		transaction.commit();
		closeconnection();
		
		return emp;
		
	}

	public Employee search(int id) {
		openconnection();
		transaction.begin();
		Employee emp=manager.find(Employee.class, id);
		
		transaction.commit();
		closeconnection();
		
		return emp;
		
		
		
	}

	public Employee delete(int id) {
		
		openconnection();
		transaction.begin();
		Employee emp=manager.find(Employee.class, id);
		 if (emp != null) {
	            manager.remove(emp);
	            transaction.commit();
	        } 
		closeconnection();
		return emp;
	}

	public List<Employee> getallemployees() {
		openconnection();
		transaction.begin();
		String jpql="from Employee";
		Query query= manager.createQuery(jpql);
		
		List<Employee> emps=query.getResultList();
		
		transaction.commit();
		closeconnection();
		return emps;

	}

	public Employee update(int id,String name,String email,String contact,String role,double salary) {
		openconnection();
		transaction.begin();
		Employee emp=manager.find(Employee.class, id);
		emp.setContact(contact);
		emp.setEmail(email);
		emp.setName(name);
		emp.setRole(role);
		emp.setSalary(salary);
		transaction.commit();
		closeconnection();
		return emp;
		
	}

}
