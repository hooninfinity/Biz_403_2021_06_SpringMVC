package com.team.starbucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/freenotice")
public class FreeNoticeController {

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String freenotice() {
		log.info("freenotice {}.");
		return "freenotice/list";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		return "freenotice/input";
	}

}
