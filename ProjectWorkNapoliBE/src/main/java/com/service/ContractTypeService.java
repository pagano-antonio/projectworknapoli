package com.service;

import org.springframework.stereotype.Service;

import com.dto.ContractTypeDTO;
import com.model.ContractType;

@Service
public class ContractTypeService {

	public ContractTypeDTO mapToDTO(ContractType contract) {
		ContractTypeDTO dto = new ContractTypeDTO(contract.getIdContractType(), contract.getTitle(),
				contract.getDescription());
		return dto;
	}
}
