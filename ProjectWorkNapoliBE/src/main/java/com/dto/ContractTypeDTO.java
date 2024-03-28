package com.dto;

public class ContractTypeDTO {
	private int idContractType;

	private String description;

	private String title;

	public ContractTypeDTO() {
	}

	public ContractTypeDTO(int idContractType, String title, String description) {
		super();
		this.idContractType = idContractType;
		this.description = description;
		this.title = title;
	}

	public int getIdContractType() {
		return idContractType;
	}

	public void setIdContractType(int idContractType) {
		this.idContractType = idContractType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
