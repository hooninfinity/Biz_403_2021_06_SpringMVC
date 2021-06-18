package com.callor.score.controller;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public class StudentController {
	
	public String list(HttpSession hSession, Model model) {
		
		
		return "student/info";
	}

}
