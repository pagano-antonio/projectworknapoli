package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.CandidateSkill;

import jakarta.transaction.Transactional;

public interface CandidateSkillRepository extends JpaRepository<CandidateSkill, Integer> {
	@Transactional
	void deleteByCandidateIdCandidate(int candidateId);
}
