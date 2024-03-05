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

import com.dao.EducationDegreeTypeRepository;
import com.model.EducationDegreeType;

@RestController
@RequestMapping("EducationDegreeType")

public class EducationDegreeTypeRest {

	@Autowired
	private EducationDegreeTypeRepository educationDegreeTypeRep;

/////////////////////////////////////////////////////////////////////////   

@PostMapping("addEducationDegreeType")
public String addEducationDegreeType(@RequestBody EducationDegreeType educationDegreeType) {
System.out.println("operation add complete for " + educationDegreeType);
educationDegreeTypeRep.save(educationDegreeType);

return "operation add complete";
}

/////////////////////////////////////////////////////////////////////////
	
@PutMapping("updateEducationDegreeType")
public String updateEducationDegreeType(@RequestBody EducationDegreeType educationDegreeType) {
	System.out.println("operation update complete for " + educationDegreeType);
	educationDegreeTypeRep.save(educationDegreeType);

	return "operation update complete";
}

/////////////////////////////////////////////////////////////////////////	

@DeleteMapping("deleteEducationDegreeType/{id}")
public String deleteEducationDegreeType(@PathVariable("id") int id) {
	System.out.println("operation delete complete for id " + id);
	educationDegreeTypeRep.deleteById(id);

	return "operation delete complete";
}

/////////////////////////////////////////////////////////////////////////

@GetMapping("findById/{id}")
public EducationDegreeType findById(@PathVariable("id") int id) {

	EducationDegreeType res = educationDegreeTypeRep.findById(id).get();

	return res;
}

/////////////////////////////////////////////////////////////////////////   

	
}
