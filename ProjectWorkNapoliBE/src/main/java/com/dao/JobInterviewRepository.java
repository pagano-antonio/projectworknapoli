package com.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.model.JobInterview;

public interface JobInterviewRepository extends JpaRepository<JobInterview, Integer> {

	@Query("SELECT ji FROM JobInterview ji " + "WHERE (:idJobInterview = 0 OR ji.idJobInterview = :idJobInterview) "
			+ "AND (:idCandidate = 0 OR :idCandidate is NULL OR ji.candidate.idCandidate = :idCandidate) "
			+ "AND (:date IS NULL OR ji.date = :date) "
			+ "AND (:idStateJobInterview = 0 OR ji.stateJobInterview.idStateJobInterview = :idStateJobInterview) "
			+ "AND (:notes IS NULL OR ji.notes LIKE CONCAT('%', :notes, '%')) "
			+ "AND (:outcome = 0 OR ji.outcome = :outcome) "
			+ "AND (:idEmployee = 0 OR ji.employee.idEmployee = :idEmployee)")
	List<JobInterview> findByCriteria(@Param("idJobInterview") int idJobInterview,
			@Param("idCandidate") int idCandidate, @Param("date") Date date,
			@Param("idStateJobInterview") int idStateJobInterview, @Param("notes") String notes,
			@Param("outcome") int outcome, @Param("idEmployee") int idEmployee);

	@Query("SELECT j.stateJobInterview.title AS stateDescription, COUNT(j) AS numOfJobInterviews "
			+ "FROM JobInterview j " + "GROUP BY j.stateJobInterview.title")
	List<Object[]> countJobInterviewsByState();
}
