// JobOfferDTO.java
package com.dto;

import java.time.LocalDate;

public class JobOfferDTO {
	private int idJobOffer;
	private String description;
	private LocalDate endDate;
	private int maxRal;
	private int minRal;
	private LocalDate startDate;
	private String title;
	private String companyName;
	private int companyID;
	private String contractTypeTitle;
	private int contractTypeID;

	public int getIdJobOffer() {
		return idJobOffer;
	}

	public void setIdJobOffer(int idJobOffer) {
		this.idJobOffer = idJobOffer;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public int getMaxRal() {
		return maxRal;
	}

	public void setMaxRal(int maxRal) {
		this.maxRal = maxRal;
	}

	public int getMinRal() {
		return minRal;
	}

	public void setMinRal(int minRal) {
		this.minRal = minRal;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getContractTypeTitle() {
		return contractTypeTitle;
	}

	public void setContractTypeTitle(String contractTypeTitle) {
		this.contractTypeTitle = contractTypeTitle;
	}

	public int getCompanyID() {
		return companyID;
	}

	public void setCompanyID(int companyID) {
		this.companyID = companyID;
	}

	public int getContractTypeID() {
		return contractTypeID;
	}

	public void setContractTypeID(int contractTypeID) {
		this.contractTypeID = contractTypeID;
	}

}
