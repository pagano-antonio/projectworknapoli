package com.model;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;

/**
 * The persistent class for the candidate_skill database table.
 * 
 */
@Entity
@Table(name = "candidate_skill")
@NamedQuery(name = "CandidateSkill.findAll", query = "SELECT c FROM CandidateSkill c")
public class CandidateSkill implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idCandidateSkill;

	// bi-directional many-to-one association to Candidate
	@ManyToOne
	@JoinColumn(name = "idCandidate")
	@JsonIgnore
	private Candidate candidate;

	// bi-directional many-to-one association to Skill
	@ManyToOne
	@JoinColumn(name = "idSkill")
	private Skill skill;

	public CandidateSkill() {
	}

	public int getIdCandidateSkill() {
		return this.idCandidateSkill;
	}

	public void setIdCandidateSkill(int idCandidateSkill) {
		this.idCandidateSkill = idCandidateSkill;
	}

	public Candidate getCandidate() {
		return this.candidate;
	}

	public void setCandidate(Candidate candidate) {
		this.candidate = candidate;
	}

	public Skill getSkill() {
		return this.skill;
	}

	public void setSkill(Skill skill) {
		this.skill = skill;
	}

}