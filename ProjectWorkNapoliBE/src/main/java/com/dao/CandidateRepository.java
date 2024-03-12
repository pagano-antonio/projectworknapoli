package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.model.Candidate;

public interface CandidateRepository extends JpaRepository<Candidate, Integer>{
	
	@Query(value="SELECT DISTINCT c.* FROM candidate c INNER JOIN job_interview j ON j.idCandidate = c.idCandidate "
			+ "WHERE j.outcome = ?1", nativeQuery = true)
	List<Candidate> findCandidateByOutcome(Integer outcome);
	
	@Query(value="SELECT DISTINCT c.* FROM candidate c INNER JOIN job_interview j ON j.idCandidate = c.idCandidate "
			+ "INNER JOIN state_job_interview s ON j.idStateJobInterview = s.idStateJobInterview "
			+ "WHERE s.idStateJobInterview = ?1", nativeQuery = true)
	List<Candidate> findCandidateByIdStateInterview(Integer idStateInterview);
	
	@Query(value="SELECT DISTINCT c.* FROM candidate c INNER JOIN education e ON c.idCandidate = e.idCandidate "
			+ "INNER JOIN education_degree_type et ON e.idEducationDegreeType = et.idEducationDegreeType "
			+ "WHERE et.idEducationDegreeType = ?1", nativeQuery = true)
	List<Candidate> findByTypeIdEducation(Integer idEducationDegreeType);

}
