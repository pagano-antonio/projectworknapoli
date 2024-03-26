package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.model.ContractType;
import com.model.Skill;

public interface ContractTypeRepository extends JpaRepository<ContractType, Integer> {

	@Query("SELECT c FROM ContractType c WHERE (:title IS NULL OR :title = '' OR c.title = :title) AND (:description IS NULL OR :description = '' OR c.description LIKE %:description%)")
	List<ContractType> findByCriteria(@Param("title") String title,
			@Param("description") String description);
	

}
