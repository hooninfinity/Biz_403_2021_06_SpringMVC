package com.callor.score.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.StudentVO;
import com.callor.score.service.StudentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/student")
@Controller
public class StudentController {
	
	protected final StudentService stService;
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public String student(HttpSession hSession, Model model) {
		
		List<StudentVO> stList = stService.selectAll();
		model.addAttribute("STUDENT", stList);
		
		log.debug("Student Root");
		return "home";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert() {
		return "student/input";
	}
	
	

}
