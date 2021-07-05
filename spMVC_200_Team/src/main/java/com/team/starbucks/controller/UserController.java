package com.team.starbucks.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.starbucks.model.UserVO;
import com.team.starbucks.service.UserService;

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
	public String login(@RequestParam(name = "MSG", required = false) String msg, Model model) {

		if (msg == null) {
			model.addAttribute("MSG", "NONE");
		} else if (msg.equals("LOGIN")) {
			model.addAttribute("MSG", "권한없음 로그인 수행!!!");
		} else if (msg.equals("LOGIN_FAIL")) {
			model.addAttribute("MSG", "아이디 비번 확인 !!!");
		}
		return "user/login";
	}
	
	
//	
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login() {
//		return "/user/login";
//	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO usVO, HttpServletRequest req, Model model) {
		
		HttpSession session = req.getSession();
		
		UserVO loginInfo = usService.login(usVO);
		
		if (loginInfo == null) {
			session.setAttribute("LOGIN", null);
			model.addAttribute("FAIL","FAIL");
			return "/user/login";
		} else {
			session.setAttribute("LOGIN", loginInfo);
		}
		return "redirect:/";
		
		
	
		
		
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}

	
	
	
	
	
	
}
