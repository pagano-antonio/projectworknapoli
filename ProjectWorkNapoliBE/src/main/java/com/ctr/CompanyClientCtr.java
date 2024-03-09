package com.ctr;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dao.CompanyClientRepository;
import com.model.CompanyClient;

@RestController
@RequestMapping("/company-clients")
public class CompanyClientCtr {
    
    @Autowired
    private CompanyClientRepository companyClientRepository;

    @GetMapping
    public List<CompanyClient> getAllCompanyClients() {
        return companyClientRepository.findAll();
    }

    @GetMapping("/{id}")
    public CompanyClient getCompanyClientById(@PathVariable Integer id) {
        return companyClientRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Client not found"));
    }

    @PostMapping
    public CompanyClient createCompanyClient(@RequestBody CompanyClient companyClient) {
        return companyClientRepository.save(companyClient);
    }

    @PutMapping("/{id}")
    public CompanyClient updateCompanyClient(@PathVariable Integer id, @RequestBody CompanyClient updatedCompanyClient) {
      // Optional<CompanyClient> update = companyClientRepository.findById(id);
        //companyClientRepository.
        
        return companyClientRepository.save(updatedCompanyClient);
    }

    @DeleteMapping("/{id}")
    public void deleteCompanyClient(@PathVariable Integer id) {
        companyClientRepository.deleteById(id);
    }
}