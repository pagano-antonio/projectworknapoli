package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.model.EducationDegreeType;

public interface EducationDegreeTypeRepository extends JpaRepository<EducationDegreeType, Integer> {
	@Query("SELECT e FROM EducationDegreeType e WHERE (:id IS NULL OR e.idEducationDegreeType = :id) AND (:description IS NULL OR :description = '' OR e.description LIKE %:description%)")
	List<EducationDegreeType> findByCriteria(@Param("id") Integer id, @Param("description") String description);
}
