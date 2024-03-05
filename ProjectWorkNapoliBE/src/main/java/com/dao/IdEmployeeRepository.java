package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.IdEmployee;

public interface IdEmployeeRepository extends JpaRepository<IdEmployee, Integer>{

}
