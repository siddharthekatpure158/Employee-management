package com.springmvc.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

@Entity
@Data
public class Employee {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int id;
    
    private String name;
    private String email;
    private String contact;
    private String role;
    private double salary;
}
