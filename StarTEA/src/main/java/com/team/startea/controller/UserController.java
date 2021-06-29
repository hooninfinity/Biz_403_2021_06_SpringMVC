package com.team.startea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "/user")
@Controller
public class UserController {
	
	
	public String list() {
		return "home";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join() {
		
		
		return null;
		
	}

}
