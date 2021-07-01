package com.team.startea.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.startea.model.UserVO;
import com.team.startea.service.UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping(value = "/user")
@Controller
public class UserController {
	
	protected final UserService usService;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "/user/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO usVO, Model model) {
		usService.join(usVO);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "/user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO usVO, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		UserVO loginInfo = usService.login(usVO);
		
		if (loginInfo == null) {
			session.setAttribute("LOGIN", null);
		} else {
			session.setAttribute("LOGIN", loginInfo);
		}
		
		return "redirect:/";
	}

}
