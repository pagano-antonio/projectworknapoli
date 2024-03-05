package com.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dao.StateJobInterviewRepository;
import com.model.StateJobInterview;

@RestController
@RequestMapping("/stateJobInterview")
public class StateJobInterviewRest {
	
    @Autowired
    private StateJobInterviewRepository stateJobIntRep;
    
    @GetMapping("findById/{id}")
    @ResponseBody
    public StateJobInterview findById(@PathVariable("id") int id) {
    
    	StateJobInterview res = stateJobIntRep.findById(id).get();
    	
    	return res;
    	
    }
    
    @PostMapping
    public String add(@RequestBody StateJobInterview s) {

    	stateJobIntRep.save(s);
        System.out.println("Inserito nel db:"+s.getId());
        return "OK";
    }
    
    @PutMapping
    public String update(@RequestBody StateJobInterview s) {

    	stateJobIntRep.save(s);
        System.out.println("Aggiornato nel db");
        return "OK";
    }
    
    @DeleteMapping("deleteById/{id}")
    public void delete(@PathVariable("id") Integer id) {

    	stateJobIntRep.deleteById(id);
        System.out.println("Eliminato dal db");
        
    }
    
    

}
