package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.WorkExperience;

import jakarta.transaction.Transactional;

public interface WorkExperienceRepository extends JpaRepository<WorkExperience, Integer> {
	@Transactional
	void deleteByCandidateIdCandidate(int candidateId);

}
