package com.dao;

import java.math.BigInteger;
import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.model.Candidate;

public interface CandidateRepository extends JpaRepository<Candidate, Integer> {

	@Query(value = "SELECT DISTINCT c.* FROM candidate c INNER JOIN job_interview j ON j.idCandidate = c.idCandidate "
			+ "WHERE j.outcome = ?1", nativeQuery = true)
	List<Candidate> findCandidateByOutcome(Integer outcome);

	@Query(value = "SELECT DISTINCT c.* FROM candidate c INNER JOIN job_interview j ON j.idCandidate = c.idCandidate "
			+ "INNER JOIN state_job_interview s ON j.idStateJobInterview = s.idStateJobInterview "
			+ "WHERE s.idStateJobInterview = ?1", nativeQuery = true)
	List<Candidate> findCandidateByIdStateInterview(Integer idStateInterview);

	@Query(value = "SELECT DISTINCT c.* FROM candidate c INNER JOIN education e ON c.idCandidate = e.idCandidate "
			+ "INNER JOIN education_degree_type et ON e.idEducationDegreeType = et.idEducationDegreeType "
			+ "WHERE et.idEducationDegreeType = ?1", nativeQuery = true)
	List<Candidate> findByTypeIdEducation(Integer idEducationDegreeType);

	List<Candidate> findBySurname(String surname);

	List<Candidate> findByPhone(BigInteger phone);

	List<Candidate> findByCity(String city);

//	Gesù prega per noi, grazie mille

	@Query("SELECT DISTINCT c FROM Candidate c " + "LEFT JOIN c.candidateSkills cs " + "LEFT JOIN c.educations ed "
			+ "LEFT JOIN c.jobInterviews ji " + "WHERE (:name IS NULL OR :name = '' OR c.name = :name) AND "
			+ "(:surname IS NULL OR :surname = '' OR c.surname = :surname) AND "
			+ "(:place IS NULL OR :place = '' OR c.birthPlace = :place) AND "
			+ "(:city IS NULL OR :city = '' OR c.city = :city) AND "
			+ "(:email IS NULL OR :email = '' OR c.email = :email) AND " + "(:phone IS NULL OR c.phone = :phone) AND "
			+ "(:address IS NULL OR c.address LIKE CONCAT('%', :address, '%')) AND "
			+ "(:birth IS NULL OR :birth = c.birthday) AND "
			+ "(:degree IS NULL OR ed.educationDegreeType.idEducationDegreeType = :degree) AND "
			+ "(:stateJobInterview IS NULL OR ji.stateJobInterview.idStateJobInterview = :stateJobInterview) AND "
			+ "(:dateAfter is NULL or ji.date >= :dateAfter) AND " + "(COALESCE(:selectedSkills, NULL) IS NULL OR "
			+ " (SELECT COUNT(DISTINCT s.idSkill) FROM CandidateSkill cs JOIN cs.skill s WHERE cs.candidate = c AND s.idSkill IN :selectedSkills) = "
			+ " (SELECT COUNT(DISTINCT s.idSkill) FROM Skill s WHERE s.idSkill IN :selectedSkills)) AND "
			+ "(ed IS NOT NULL OR ji IS NOT NULL) AND " + "(cs IS NOT NULL)")
	List<Candidate> findByCriteria(@Param("name") String name, @Param("surname") String surname,
			@Param("place") String place, @Param("birth") LocalDate birth, @Param("city") String city,
			@Param("address") String address, @Param("email") String email, @Param("phone") BigInteger phone,
			@Param("selectedSkills") List<Integer> selectedSkills, @Param("degree") Integer degree,
			@Param("stateJobInterview") Integer stateJobInterview, @Param("dateAfter") LocalDate dateAfter);

}
