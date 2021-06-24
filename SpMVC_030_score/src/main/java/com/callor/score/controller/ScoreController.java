package com.callor.score.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.ScoreDTO;
import com.callor.score.service.ScoreService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@RequestMapping("/score")
@Controller
public class ScoreController {
	
	protected final ScoreService scService;
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public String scoreList(Model model) {
		
		List<ScoreDTO> scoreList = scService.scoreAllList();
		log.debug("Score {} ", scoreList.toString());
		// 뷰로 보내기 위해서 모델에 담는다. scoreList를 "SCORES"라는 이름으로
		model.addAttribute("SCORES", scoreList);
		
		// BODY라는 변수에 SCORE_VIEW라는 것을 열겠다. 앞으로는 리턴을 모두 home으로 예정
		// home.jsp에 있는 "BODY"라는 이름의 변수가 "SCORE_VIEW"이면
		model.addAttribute("BODY", "SCORE_VIEW");
		return "home";
		
	}
	

}
