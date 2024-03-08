package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.WorkExperienceRepository;

@Controller
@RequestMapping("workExpCtr")
public class WorkExperienceCtr {
	
	@Autowired
    private WorkExperienceRepository WorkExperienceRep;

	@GetMapping("/home")
    public String home(Model model) {
		
        return "workExperience/indexWorkExp";
        
    }
	
}
