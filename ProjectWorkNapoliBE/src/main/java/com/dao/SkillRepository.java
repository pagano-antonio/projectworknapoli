package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.Skill;

public interface SkillRepository extends JpaRepository<Skill, Integer> {

}
