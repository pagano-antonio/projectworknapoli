package com.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.dao.ContractTypeRepository;
import com.model.ContractType;

@RestController
@RequestMapping("ContractTypeCtr")
public class ContractTypeCtr{
    
    @Autowired
    private ContractTypeRepository contractTypeRepository;

    @GetMapping
    public List<ContractType> getAllContractType() {
        return contractTypeRepository.findAll();
    }

    @GetMapping("/{id}")
    public ContractType getContractTypeById(@PathVariable Integer id) {
        return contractTypeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Contract not found"));
    }

    @PostMapping
    public ContractType createContractType(@RequestBody ContractType contractType) {
        return contractTypeRepository.save(contractType);
    }

    @PutMapping("/{id}")
    public ContractType updateContractType(@PathVariable Integer id, @RequestBody ContractType updatedContractType) {
      // Optional<CompanyClient> update = companyClientRepository.findById(id);
        //companyClientRepository.
        
        return contractTypeRepository.save(updatedContractType);
    }

    @DeleteMapping("/{id}")
    public void deleteContractType(@PathVariable Integer id) {
    	contractTypeRepository.deleteById(id);
    }
}
