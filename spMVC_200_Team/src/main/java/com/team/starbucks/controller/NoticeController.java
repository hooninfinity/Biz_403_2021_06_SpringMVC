package com.team.starbucks.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/publicnotice")
public class NoticeController {

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String home() {
		log.info(" publicnotice root {}.");
		return "publicnotice/list";
	}

}
