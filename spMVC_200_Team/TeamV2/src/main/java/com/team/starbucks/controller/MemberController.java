package com.team.starbucks.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String login() {
		log.info(" member root {}.");
		return "member/login";
	}
	@RequestMapping(value = { "/", "" }, method = RequestMethod.POST)
	public String login2() {
		log.info(" member root {}.");
		return "member/login";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}

}
