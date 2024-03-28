package com.dto;

import java.math.BigInteger;
import java.time.LocalDate;
import java.util.List;

import com.model.CandidateCommercialData;
import com.model.Education;
import com.model.Skill;
import com.model.WorkExperience;

import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

public class CandidateDTO {

	public int idCandidate;

	public String address;

	@Temporal(TemporalType.DATE)
	public LocalDate birthday;

	public String birthPlace;

	public String city;

	public String email;

	public String name;

	public BigInteger phone;

	public String surname;
	public List<Education> educations;
	public List<WorkExperience> workExperiences;
	public List<CandidateCommercialData> commercialData;
	public List<Skill> candidateSkills;

	public List<Education> getEducations() {
		return educations;
	}

	public void setEducations(List<Education> educations) {
		this.educations = educations;
	}

	public List<WorkExperience> getWorkExperiences() {
		return workExperiences;
	}

	public void setWorkExperiences(List<WorkExperience> workExperiences) {
		this.workExperiences = workExperiences;
	}

	public List<CandidateCommercialData> getCommercialData() {
		return commercialData;
	}

	public void setCommercialData(List<CandidateCommercialData> commercialData) {
		this.commercialData = commercialData;
	}

	public List<Skill> getSkills() {
		return candidateSkills;
	}

	public void setSkills(List<Skill> skills) {
		this.candidateSkills = skills;
	}

	public int getIdCandidate() {
		return idCandidate;
	}

	public void setIdCandidate(int idCandidate) {
		this.idCandidate = idCandidate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public String getBirthPlace() {
		return birthPlace;
	}

	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigInteger getPhone() {
		return phone;
	}

	public void setPhone(BigInteger phone) {
		this.phone = phone;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	@Override
	public String toString() {
		return "CandidateDTO [skills=" + candidateSkills + "]";
	}

}
