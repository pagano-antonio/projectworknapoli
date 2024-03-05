package com.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dao.EducationRepository;
import com.model.Education;

@RestController
@RequestMapping("Education")

public class EducationRest {

	@Autowired
	private EducationRepository educationRep;
	
/////////////////////////////////////////////////////////////////////////   

@PostMapping("addEducation")
public String addEducation(@RequestBody Education education) {
System.out.println("operation add complete for " + education);
educationRep.save(education);

return "operation add complete";
}

/////////////////////////////////////////////////////////////////////////

@PutMapping("updateEducation")
public String updateEducation(@RequestBody Education education) {
	System.out.println("operation update complete for " + education);
	educationRep.save(education);

	return "operation update complete";
}

/////////////////////////////////////////////////////////////////////////	

@DeleteMapping("deleteEducation/{id}")
public String deleteEducation(@PathVariable("id") int id) {
	System.out.println("operation delete complete for id " + id);
	educationRep.deleteById(id);

	return "operation delete complete";
}

/////////////////////////////////////////////////////////////////////////

@GetMapping("findById/{id}")
public Education findById(@PathVariable("id") int id) {

	Education res = educationRep.findById(id).get();

	return res;
}

/////////////////////////////////////////////////////////////////////////   


}
