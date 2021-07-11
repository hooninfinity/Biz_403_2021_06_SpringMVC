package com.team.starbucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/eventcalender")
public class EventCellendarController {

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String costums() {
		log.debug("calender root");
		
		
		
		
		return "calender/eventcalender";
	}

}
