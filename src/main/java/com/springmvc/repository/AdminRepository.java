package com.springmvc.repository;

import org.springframework.stereotype.Repository;

import com.springmvc.model.Admin;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

@Repository
public class AdminRepository {
	
	
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

	public Admin addAdmin(String name, String email, String password) {
	   openconnection();
	   transaction.begin();
	   
	   Admin admin=new Admin();
	   admin.setName(name);
	   admin.setEmail(email);
	   admin.setPass(password);
	   
	   manager.persist(admin);
	   
	   transaction.commit();
	   closeconnection();
	   
	   return admin;
		
	}

	public void login(String email, String password) {
	
		
		System.out.println(email);
		
		
		
	}

}
