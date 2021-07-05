package com.team.starbucks.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping
public class HomeController {


	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	

}
