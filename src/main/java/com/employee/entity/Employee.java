package com.employee.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name="emp777")
public class Employee {
	@Id
	private String id;
	private String name;
	private String designation;
	private double salary;
	private String email;
	private String mobile;
	private String qualification;
	@ManyToOne(cascade =  CascadeType.PERSIST, fetch = FetchType.EAGER)
	private Employee manager;

}
