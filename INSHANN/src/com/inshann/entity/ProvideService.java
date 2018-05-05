package com.inshann.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="PROVIDE_SERVICE")
public class ProvideService 
{
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_ID" )
	@SequenceGenerator(name = "SEQ_ID", sequenceName = "SEQ_ID", allocationSize = 1)
	@Column(name="SEQ_ID")
	private int id; 
	
	@Column(name="NEED")
	private String need;
	
	@Column(name="FOR_WHAT")
	private String forWhat;
	
	@Column(name="PRICE")
	private String price;
	
	@Column(name="DURATION")
	private String duration;
	
	@Column(name="DESCRIPTION",length=1500)
	private String description;
	
	@Column(name="LOCATION")
	private String location;
	
	
	
	
	public String getNeed() {
		return need;
	}

	public void setNeed(String need) {
		this.need = need;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getForWhat() {
		return forWhat;
	}

	public void setForWhat(String forWhat) {
		this.forWhat = forWhat;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	
	
	
}
