package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.Employee;

public interface LoginRepository extends JpaRepository<Employee, Integer> {
	Employee findByUsername(String username);

	Employee findByUsernameAndPassword(String username, String password);

	Employee findByEmail(String email);
}
