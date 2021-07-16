//package com.team.starbucks.controller;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//@Controller
//public class HomeController {
//	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
//	public String home() {
//		return "home";
//	}
//	
//
//}
package com.team.starbucks.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.starbucks.model.CustomDTO;
import com.team.starbucks.service.CustomService;
import com.team.starbucks.service.FileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
//@RequestMapping(value = "/custom")
public class HomeController {

	@Qualifier("customServiceV1")
	protected final CustomService cuService;
	@Qualifier("fileServiceV1")
	protected final FileService fService;

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String list(HttpSession session, Model model, CustomDTO customDTO) {

		List<CustomDTO> cuList = cuService.selectAll();
		model.addAttribute("CustomList", cuList);
		//		model.addAttribute("BODY", "CUSTOM_LIST");
		return "home";
	}

}
