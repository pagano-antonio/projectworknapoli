package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.ContractType;

public interface ContractTypeRepository extends JpaRepository<ContractType, Integer> {

}
