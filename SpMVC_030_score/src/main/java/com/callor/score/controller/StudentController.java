package com.callor.score.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.StudentVO;
import com.callor.score.service.StudentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "/student")
@Controller
public class StudentController {
	
	protected final StudentService stService;
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public String list(Model model) {
		
		List<StudentVO> stList = stService.selectAll();
		
		// stList를 가져와서 "STUDENT"라고 하고
		model.addAttribute("STUDENTS", stList);
		
		
		// String BODY = "STUDENT_LIST"
		// view.rendering(BODY) 한 것과 같다
		
		// home.jsp에 있는 "BODY"라는 이름의 변수가 "STUDENT_LIST"이면
		model.addAttribute("BODY","STUDENT_LIST");
		return "home";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(Model model) {
		model.addAttribute("BODY", "STUDENT_INPUT");
		return "home";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(StudentVO studentVO, Model model) {
		
		
		
		model.addAttribute("BODY", "STUDENT_INPUT");
		return "home";
	}
	
	
	

}
