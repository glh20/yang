package com.care.modelDTO;

import org.springframework.stereotype.Service;

@Service
public class NaverDTO {

	private String navername;
	private String naveremail;
	private String navergender;
	public String getNaveremail() {
		return naveremail;
	}
	public void setNaveremail(String naveremail) {
		this.naveremail = naveremail;
	}
	public String getNavergender() {
		return navergender;
	}
	public void setNavergender(String navergender) {
		this.navergender = navergender;
	}
	public String getNavername() {
		return navername;
	}
	public void setNavername(String navername) {
		this.navername = navername;
	}
	
	
}
