package com.callor.score.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.score.model.ScoreInputVO;
import com.callor.score.model.StudentVO;
import com.callor.score.model.SubjectAndScoreDTO;
import com.callor.score.service.ScoreService;
import com.callor.score.service.StudentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "/student")
@Controller
public class StudentController {
	
	protected final StudentService stService;
	// protected final ScoreService scService;
	
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
		
		StudentVO stVO = new StudentVO();
		stVO.setSt_num( stService.makeStNum() );
		// stVO를 STD라는 이름으로 셋팅
		model.addAttribute("STD", stVO);
		model.addAttribute("BODY", "STUDENT_INPUT");
		return "home";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(StudentVO studentVO, Model model) {
		
		log.debug("Req 학생정보 : {}", studentVO.toString());
		
		int ret = stService.insert(studentVO);
		
		model.addAttribute("BODY", "STUDENT_INPUT");
		// 입력이 끝난 다음에는 리스트로 가라
		return "redirect:/student";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String st_num, Model model) {
		
//		List<SubjectAndScoreDTO> ssList = scService.selectScore(st_num);
		
		String ret = stService.detail(model, st_num);
		
//		model.addAttribute("SSLIST", ssList); //home.jsp에 BODY == 'STUDENT_DETAIL'일 경우 include 되는 파일인 detail.jsp에 SSLIST가 있다
		model.addAttribute("BODY", "STUDENT_DETAIL");
		return "home";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
//	public String detail(
//		@RequestParam(name = "subject") List<String> subject,
//		@RequestParam(name = "score") List<String> score) {
	
	public String detail(ScoreInputVO scInputVO) {
		
//		log.debug("Subject : {} ", subject.toString());
//		log.debug("Score : {} ", score.toString());
		
		log.debug("Score Input {}", scInputVO.toString());
		
		String ret = stService.scoreInput(scInputVO);
		
		return "home";
	}
	

}
