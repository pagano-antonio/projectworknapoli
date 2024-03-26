package com.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.dao.ContractTypeRepository;
import com.model.ContractType;

@Controller
@RequestMapping("ContractTypeCtr")
public class ContractTypeCtr{
    
    @Autowired
    private ContractTypeRepository contractTypeRepository;

    @GetMapping("allContractType")
    public String getAllContractType(Model model) {
    	List<ContractType> c= contractTypeRepository.findAll();
    	model.addAttribute("showToast", true);
    	if (c.size() == 0) {
            model.addAttribute("toastTitle", "Warning");
            model.addAttribute("toastMessage", "No Contract Type found. Add one first!");
            return "skill/addSkill";
        } else {
        	model.addAttribute("ContractType", c);
            model.addAttribute("toastTitle", "Success");

            if (c.size() == 1) {
                model.addAttribute("toastMessage", "1 Contract Type found");
            } else {
                model.addAttribute("toastMessage", c.size() + " Contract Types found");
            }
            }
    	return "ContractType/AllContractType";
    }

    @GetMapping("/SearchContractTypeform")
    public String SearchContractTypeform() {
    	return "ContractType/SearchContractType";
     
    }
    
    @PostMapping("/SearchContractType")
    public String SearchContractType(@ModelAttribute ContractType ct, Model model) {
    	 List<ContractType> Founded = contractTypeRepository.findByCriteria(ct.getTitle(),ct.getDescription());
    	 model.addAttribute("showToast", true);
    	 if (Founded.size()>0){
    		 model.addAttribute("ContractType", Founded);
    		 model.addAttribute("toastTitle", "Success");
    	        model.addAttribute("toastMessage", Founded.size()+ " Contract Types Found");
    	     return "ContractType/AllContractType";
    	 } else {
    		 model.addAttribute("toastTitle", "Warning");
 	        model.addAttribute("toastMessage", " Contract Types Not Found");
    		 return "ContractType/SearchContractType"; 
    	 }
   
    }
    @GetMapping("/addContractTypeform")
    public String addContractTypeform() {
        return "ContractType/addContractType";
                
    }
    @PostMapping("/createContractType")
    public String createContractType(@ModelAttribute ContractType contractType, Model model) {
        contractTypeRepository.saveAndFlush(contractType);
        List<ContractType> c= contractTypeRepository.findAll();
        model.addAttribute("ContractType", c);
        model.addAttribute("showToast", true);
        model.addAttribute("toastTitle", "Success");
        model.addAttribute("toastMessage", "Contract Type Added");
        return "ContractType/AllContractType";
    }

    @GetMapping("/updateContractTypeForm")
    public String updateContractType(@RequestParam("id") Integer id, Model model) {
    ContractType c= contractTypeRepository.findById(id).get();
    model.addAttribute("ContractType", c);
        return "ContractType/updateContractType";
    }
    @PostMapping("/update")
    public String updateCOntractType (@ModelAttribute ContractType contractType, Model model) {
        contractTypeRepository.saveAndFlush(contractType);
        List<ContractType> c= contractTypeRepository.findAll();
        model.addAttribute("ContractType", c);
        model.addAttribute("showToast", true);
        model.addAttribute("toastTitle", "Success");
        model.addAttribute("toastMessage", "Contract Type Edited");
        return "ContractType/AllContractType";
    }

    @GetMapping("/delete")
    public String deleteContractType(@RequestParam("id") Integer id, Model model) {
    	contractTypeRepository.deleteById(id);
    	List<ContractType> c= contractTypeRepository.findAll();
        model.addAttribute("ContractType", c);
        model.addAttribute("showToast", true);
        model.addAttribute("toastTitle", "Success");
        model.addAttribute("toastMessage", "Contract Type Deleted");
        return "ContractType/AllContractType";
    }
}
