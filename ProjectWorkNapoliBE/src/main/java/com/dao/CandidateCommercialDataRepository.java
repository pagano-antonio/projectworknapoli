package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.CandidateCommercialData;

import jakarta.transaction.Transactional;

// commento di prova
public interface CandidateCommercialDataRepository extends JpaRepository<CandidateCommercialData, Integer> {

	@Transactional
	void deleteByCandidateIdCandidate(int idCandidate);

}
