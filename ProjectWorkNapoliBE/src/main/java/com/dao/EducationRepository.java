package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.model.Education;

public interface EducationRepository extends JpaRepository<Education, Integer> {

	@Query("SELECT e.educationDegreeType.description AS educationType, COUNT(e) AS numOfCandidates "
			+ "FROM Education e " + "GROUP BY e.educationDegreeType.description")
	List<Object[]> countCandidatesByEducationDegreeType();

}
