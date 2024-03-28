// JobOfferService.java
package com.service;

import org.springframework.stereotype.Service;

import com.dto.JobOfferDTO;
import com.model.JobOffer;

@Service
public class JobOfferService {

	public JobOfferDTO mapToDTO(JobOffer jobOffer) {
		JobOfferDTO dto = new JobOfferDTO();
		dto.setIdJobOffer(jobOffer.getIdJobOffer());
		dto.setDescription(jobOffer.getDescription());
		dto.setEndDate(jobOffer.getEndDate());
		dto.setMaxRal(jobOffer.getMaxRal());
		dto.setMinRal(jobOffer.getMinRal());
		dto.setStartDate(jobOffer.getStartDate());
		dto.setTitle(jobOffer.getTitle());
		dto.setCompanyName(jobOffer.getCompanyClient().getName());
		dto.setContractTypeTitle(jobOffer.getContractType().getTitle());
		dto.setCompanyID(jobOffer.getCompanyClient().getIdCompanyClient());
		dto.setContractTypeTitle(jobOffer.getContractType().getTitle());
		dto.setContractTypeID(jobOffer.getContractType().getIdContractType());
		return dto;
	}
}
