package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.Employee;

public interface IdEmployeeRepository extends JpaRepository<Employee, Integer> {

}
