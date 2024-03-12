package com.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.model.JobOffer;

public interface JobOfferRepository extends JpaRepository<JobOffer, Integer> {

	@Query("SELECT DISTINCT j FROM JobOffer j " + "JOIN j.jobOfferSkills js " + "WHERE js.skill.idSkill IN :skillIds")
	List<JobOffer> findJobOffersBySkillIds(@Param("skillIds") List<Integer> skillIds);

	@Query("SELECT j FROM JobOffer j " + "LEFT JOIN j.jobOfferSkills jos " + "LEFT JOIN jos.skill s "
			+ "WHERE (:id = 0 OR j.idJobOffer = :id) AND (:title IS NULL OR :title = '' OR j.title = :title) AND (:startDate IS NULL OR j.startDate >= :startDate) AND"
			+ "(:endDate IS NULL OR j.endDate <= :endDate) AND "
			+ "(:companyId IS NULL OR j.companyClient.idCompanyClient = :companyId) AND "
			+ "(:contractTypeId IS NULL OR j.contractType.idContractType = :contractTypeId) AND "
			+ "(:minRal IS NULL OR j.minRal >= :minRal) AND "
			+ "(:maxRal IS NULL OR j.maxRal <= :maxRal OR (j.maxRal IS NULL AND j.minRal >= :minRal)) AND "
			+ "(:skillIds IS NULL OR "
			+ "      (SELECT COUNT(DISTINCT s.idSkill) FROM Skill s WHERE s.idSkill IN :skillIds) = "
			+ "      (SELECT COUNT(DISTINCT s.idSkill) FROM JobOffer j2 LEFT JOIN j2.jobOfferSkills jos2 LEFT JOIN jos2.skill s WHERE j2 = j AND s.idSkill IN :skillIds))")
	List<JobOffer> findByOptionalCriteria(@Param("id") Integer id, @Param("title") String title,
			@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate,
			@Param("companyId") Integer companyId, @Param("contractTypeId") Integer contractTypeId,
			@Param("minRal") Integer minRal, @Param("maxRal") Integer maxRal,
			@Param("skillIds") List<Integer> skillIds);

}
