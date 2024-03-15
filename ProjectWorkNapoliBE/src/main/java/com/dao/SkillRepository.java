package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.model.Skill;

public interface SkillRepository extends JpaRepository<Skill, Integer> {

	@Query("SELECT s FROM Skill s WHERE (:id IS NULL OR s.idSkill = :id) AND (:title IS NULL OR :title = '' OR s.title = :title) AND (:description IS NULL OR :description = '' OR s.description LIKE %:description%)")
	List<Skill> findByCriteria(@Param("id") Integer idSkill, @Param("title") String title,
			@Param("description") String description);

}
