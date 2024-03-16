package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.model.StateJobInterview;

public interface StateJobInterviewRepository extends JpaRepository<StateJobInterview, Integer> {
	@Query("SELECT s FROM StateJobInterview s WHERE (:id IS NULL OR s.idStateJobInterview = :id) AND (:title IS NULL OR :title = '' OR s.title = :title) AND (:description IS NULL OR :description = '' OR s.description LIKE %:description%)")
	List<StateJobInterview> findByCriteria(Integer id, String title, String description);

}
