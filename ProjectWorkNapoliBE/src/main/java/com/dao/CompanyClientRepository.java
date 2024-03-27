package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.model.CompanyClient;

public interface CompanyClientRepository extends JpaRepository<CompanyClient, Integer> {

	@Query("SELECT c FROM CompanyClient c WHERE (:name IS NULL OR :name = '' OR c.name = :name) AND (:address IS NULL OR :address = '' OR c.address LIKE %:address%)")
	List<CompanyClient> findByCriteria(@Param("name") String name, @Param("address") String address);

	@Query("SELECT j.companyClient.name AS companyName, COUNT(j) AS numOfJobOffers FROM JobOffer j GROUP BY j.companyClient.name")
	List<Object[]> countJobOffersByCompany();
}
