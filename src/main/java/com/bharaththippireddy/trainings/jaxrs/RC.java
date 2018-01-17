package com.bureauveritas.chemicaldischarge.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.bureauveritas.chemicaldischarge.aop.logging.CustomLogger;
import com.bureauveritas.chemicaldischarge.manish.Person;
import com.bureauveritas.chemicaldischarge.utils.BeanProvider;
import com.bureauveritas.chemicaldischarge.utils.JsonConvertor;

@RestController
@RequestMapping("/demo")
public class CRestController {

   public static Map<Long,Person> persons = new HashMap<Long, Person>();
   public static Long id = 1L;
	
	public CRestController() {
		System.out.println(CRestController.class.getSimpleName().toString());
	}
	
	@RequestMapping(value="/person/{id}", method = RequestMethod.GET )
	public ResponseEntity<Person> getPersonById(@PathVariable("id") Integer id) {
		Person person = persons.get((long)id);
		return new ResponseEntity<Person>(person, HttpStatus.OK);
	}
	@RequestMapping(value= "/person", method = RequestMethod.GET)
	public ResponseEntity<List<Person>> getAllPersons() {
		Collection<Person> coll =  persons.values();
		List<Person> list = new ArrayList<Person>(coll);
		return new ResponseEntity<List<Person>>(list, HttpStatus.OK);
	}
	@RequestMapping(value= "/person", method = RequestMethod.POST)
	public ResponseEntity<Void> addPerson(@RequestBody Person person, UriComponentsBuilder builder) {
		  person.setPid(++id);
          Person flag = persons.put(person.getPid(), person);
          HttpHeaders headers = new HttpHeaders();
          headers.setLocation(builder.path("/person/{id}").buildAndExpand(person.getPid()).toUri());
          return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}
	@RequestMapping(value="/person", method = RequestMethod.PUT )
	public ResponseEntity<Person> updatePerson(@RequestBody Person person) {
		persons.put(person.getPid(), person);
		return new ResponseEntity<Person>(person, HttpStatus.OK);
	}
	@RequestMapping(value="/person/{id}", method = RequestMethod.DELETE )
	public ResponseEntity<Void> deletePerson(@PathVariable("id") Integer id) {
		persons.remove((long)id);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}	
	
	@RequestMapping(value = "/getUsersNames", method = RequestMethod.GET)
	@ResponseBody
	public String getDistCheProductNames(String cheName) {
		String msdsListJson = "";
		try {
			Collection<Person> coll =  persons.values();
			List<Person> list = new ArrayList<Person>(coll);
			Map<String, List<Person>>vMap = new HashMap<String, List<Person>>();
			vMap.put("msdsListJson", list);
			msdsListJson = JsonConvertor.objectToJson(vMap);
		} catch (Exception e) {
			CustomLogger customLogger = (CustomLogger) BeanProvider.getBean("customLogger");
			try {
				customLogger.logException(e);
			} catch (Exception ex) {
			}
		}
		
		return msdsListJson;
	}

}
