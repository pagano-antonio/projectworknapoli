package com.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.model.CompanyClient;
import com.model.Skill;

public interface CompanyClientRepository extends JpaRepository<CompanyClient, Integer> {

	@Query("SELECT c FROM CompanyClient c WHERE (:name IS NULL OR :name = '' OR c.name = :name) AND (:address IS NULL OR :address = '' OR c.address LIKE %:address%)")
	List<CompanyClient> findByCriteria(@Param("name") String name, @Param("address") String address);
	

}
