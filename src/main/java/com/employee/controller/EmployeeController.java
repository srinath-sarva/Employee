package com.employee.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.entity.Employee;
import com.employee.repo.EmployeeRepo;


@Controller
public class EmployeeController {
	@Autowired
	private EmployeeRepo repo;
	
	@RequestMapping("/employees")
	public String employees(Model m ,@ModelAttribute Employee emp)  {
		m.addAttribute("emp", new Employee());
		List<Employee> emps= repo.findAll();
		m.addAttribute("employees", emps);
		return "employees";
	}
	@RequestMapping("/save")
	public String save(@ModelAttribute Employee emp) {
		if(emp.getManager()!=null)
		emp.setManager(repo.findById(emp.getManager().getId()).get());
		repo.save(emp);
		return "redirect:/employees";
		
	}
	
@RequestMapping("/delete/{id}")
public String delete(@PathVariable String id) {
	repo.deleteById(id);
	return "redirect:/employees";
	
}
	
@ModelAttribute("qualifications")
public List<String> qs(){
	List<String>q= new ArrayList<>();
	q.add("MBA");
	q.add("BTECH");
	q.add("BSC");
	q.add("MSC");
	return q;
} 
@ModelAttribute("designations")
public List<String> ds(){
	List<String>q= new ArrayList<>();
	q.add("CEO");
	q.add("MANAGER");
	q.add("EMPLOYEE");
	q.add("TEAM LEAD");
	return q;
} 

@RequestMapping("/update/{id}")
public String update(Model m,@PathVariable String id) {
	
	m.addAttribute("emp",repo.findById(id));
	List<Employee> emps= repo.findAll();
	m.addAttribute("employees", emps);
	return "employees";
	
}
	
	
}
