package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.JobOffer;

public interface JobOfferRepository extends JpaRepository<JobOffer, Integer> {

}
