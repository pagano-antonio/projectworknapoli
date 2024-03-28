package com.service;

import org.springframework.stereotype.Service;

import com.dto.CompanyClientDTO;
import com.model.CompanyClient;

@Service
public class CompanyService {

	public CompanyClientDTO mapToDTO(CompanyClient company) {
		CompanyClientDTO dto = new CompanyClientDTO();
		dto.setIdCompanyClient(company.getIdCompanyClient());
		dto.setAddress(company.getAddress());
		dto.setCity(company.getCity());
		dto.setName(company.getName());

		return dto;
	}
}
