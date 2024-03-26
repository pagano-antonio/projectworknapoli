package com.model;

import java.time.LocalDate;
import java.util.List;

public class SearchRequest {
	private Candidate candidate;
	private List<Integer> selectedSkills;
	private Integer degree;
	private Integer jobinterview;
	private LocalDate dateAfter;
	private String company;

	public Candidate getCandidate() {
		return candidate;
	}

	public void setCandidate(Candidate candidate) {
		this.candidate = candidate;
	}

	public List<Integer> getSelectedSkills() {
		return selectedSkills;
	}

	public void setSelectedSkills(List<Integer> selectedSkills) {
		this.selectedSkills = selectedSkills;
	}

	public Integer getDegree() {
		return degree;
	}

	public void setDegree(Integer degree) {
		this.degree = degree;
	}

	public Integer getJobinterview() {
		return jobinterview;
	}

	public void setJobinterview(Integer jobinterview) {
		this.jobinterview = jobinterview;
	}

	public LocalDate getDateAfter() {
		return dateAfter;
	}

	public void setDateAfter(LocalDate dateAfter) {
		this.dateAfter = dateAfter;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

}
