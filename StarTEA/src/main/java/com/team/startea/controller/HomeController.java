package com.team.startea.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.startea.model.UserVO;
import com.team.startea.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class HomeController {
	
	protected final UserService usService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<UserVO> usList = usService.selectAll();
		
		model.addAttribute("USERS", usList);
		
		log.debug("User {} ", usList.toString());
		
		return "redirect:/user";
	}
	
}
