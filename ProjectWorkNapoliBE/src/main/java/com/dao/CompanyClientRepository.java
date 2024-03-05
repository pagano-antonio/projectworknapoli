package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.CompanyClient;

public interface CompanyClientRepository extends JpaRepository<CompanyClient, Integer> {

}
