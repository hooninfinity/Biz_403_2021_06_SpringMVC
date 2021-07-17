package com.team.starbucks.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.starbucks.model.UserVO;
import com.team.starbucks.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "/user")
@Controller
public class UserController {
	@Qualifier("userServiceV1")
	protected final UserService usService;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model) {

		model.addAttribute("BODY", "JOIN");
		return "home";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO usVO, Model model) {
		if(usVO == null) {
			log.debug("회원가입실패");
			model.addAttribute("JOINMSG", "FAIL");
		 return "redirect:/join";
		}
			
		usService.join(usVO);
		return "redirect:/login";
	}

	@ResponseBody
	@RequestMapping(value = "/id_check", method = RequestMethod.GET)
	public String id_check(String user_id) {

		log.debug("중복 검사를 수행할 ID: {}", user_id);
		UserVO userVO = usService.findById(user_id);

		if (userVO == null) {
			return "NOT_USE_ID";
		} else {
			return "USE_ID";
		}
	}
	
	@RequestMapping(value ="/login/{url}")
	public String login(@PathVariable("url") String url) {
		
		return "redirect/user/login?url=login";
		
	}
//	@RequestMapping(value = "/login", method=RequestMethod.GET)
//	public String login2( @RequestParam(name="url", required = false, defaultValue = "NONE")String url,
//			Model model){
//		
//		return "home";
//		
//	}
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(name = "MSG", required = false) String msg, Model model) {

		if (msg == null) {
			model.addAttribute("MSG", "NONE");
		} else if (msg.equals("LOGIN")) {
			model.addAttribute("MSG", "권한없음 로그인 수행!!!");
		} else if (msg.equals("LOGIN_FAIL")) {
			model.addAttribute("MSG", "아이디 비번 확인 !!!");
		}
		model.addAttribute("BODY", "LOGIN");
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO usVO, Model model, HttpSession session) {

		UserVO userVO = usService.login(usVO);

		if (userVO == null) {
			session.setAttribute("LOGIN", null);
			model.addAttribute("FAIL", "FAIL");
			return "/user/login";
		} else {
			session.setAttribute("LOGIN", userVO);
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("LOGIN");
		return "redirect:/";
	}

}