package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.EmployeeType;

public interface EmployeeTypeRepository extends JpaRepository <EmployeeType, Integer> {

}
