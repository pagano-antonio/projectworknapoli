package com.model;

import java.io.Serializable;
import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

/**
 * The persistent class for the education database table.
 * 
 */
@Entity
@NamedQuery(name = "Education.findAll", query = "SELECT e FROM Education e")
public class Education implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idEducation;

	@Temporal(TemporalType.DATE)
	private LocalDate date;

	private String finalGrade;

	private String place;

	private String schoolName;

	// bi-directional many-to-one association to Candidate
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "idCandidate")
	private Candidate candidate;

	// bi-directional many-to-one association to EducationDegreeType
	@ManyToOne
	@JoinColumn(name = "idEducationDegreeType")
	private EducationDegreeType educationDegreeType;

	public Education() {
	}

	public int getIdEducation() {
		return this.idEducation;
	}

	public void setIdEducation(int idEducation) {
		this.idEducation = idEducation;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public String getFinalGrade() {
		return this.finalGrade;
	}

	public void setFinalGrade(String finalGrade) {
		this.finalGrade = finalGrade;
	}

	public String getPlace() {
		return this.place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getSchoolName() {
		return this.schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public Candidate getCandidate() {
		return this.candidate;
	}

	public void setCandidate(Candidate candidate) {
		this.candidate = candidate;
	}

	public EducationDegreeType getEducationDegreeType() {
		return this.educationDegreeType;
	}

	public void setEducationDegreeType(EducationDegreeType educationDegreeType) {
		this.educationDegreeType = educationDegreeType;
	}

	@Override
	public String toString() {
		return "Education [idEducation=" + idEducation + ", date=" + date + ", finalGrade=" + finalGrade + ", place="
				+ place + ", schoolName=" + schoolName + ", candidate=" + candidate + ", educationDegreeType="
				+ educationDegreeType + "]";
	}

}