package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.JobOfferSkill;

public interface JobOfferSkillRepository extends JpaRepository<JobOfferSkill, Integer> {

	List<JobOfferSkill> findByJobOfferIdJobOffer(Integer jobOfferId);
}
