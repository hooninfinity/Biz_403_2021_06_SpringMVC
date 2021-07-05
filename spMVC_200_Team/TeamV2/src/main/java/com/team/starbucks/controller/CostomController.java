package com.team.starbucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/custom")
public class CostomController {

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String costums() {
		log.debug("Custom root");
		return "custom/list";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		return "custom/input";
	}
}
