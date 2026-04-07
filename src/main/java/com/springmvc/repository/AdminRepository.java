package com.springmvc.repository;

import java.util.List;

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

	public Admin login(String email, String password) {
	    openconnection();
	    transaction.begin();
	    String jpql="from Admin where email =:email and pass=:password";
	    Query query=manager.createQuery(jpql);
	    query.setParameter("email", email);
	    query.setParameter("password", password);
	    
	    List<Admin> admin=query.getResultList();
	    
	    for(Admin a:admin) {
	    	return a;
	    }

	   return null;
	}

}
