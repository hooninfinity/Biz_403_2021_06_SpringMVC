package com.callor.jdbc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.jdbc.model.CompVO;
import com.callor.jdbc.persistance.CompDao;
import com.callor.jdbc.service.CompService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/comp")
public class CompController {
	
	protected final CompDao compDao;
	protected final CompService compService;
	public CompController(CompDao compDao, CompService compService) {
		this.compDao = compDao;
		this.compService = compService;
	}
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public String list(HttpSession hSession, Model model) {
		
		// 다른 것들과는 달리 한줄로 써보자
		if (hSession.getAttribute("USERVO") == null) {
			model.addAttribute("MSG","LOGIN");
			return "redirect:/member/login";
		}
		
		List<CompVO> compList = compService.selectAll();
		log.debug("출판사 정보 가져오기: {} ", compList.toString());
		model.addAttribute("COMPS",compList); // compList 를 "COMPS" 이름으로 담아서 view로 보낸다
		return "comp/list";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String getList(@RequestParam(name="cp_title", required = false, defaultValue = "")String searchText, Model model) {
		
		List<CompVO> compList = null;
		
		if(searchText == null || searchText.trim().equals("")) {
			compList = compService.selectAll();
		} else {
			compList = compService.findByTitleAndCeoAndTel(searchText);
		}
		model.addAttribute("COMPS", compList);
		
		return "comp/search";
	}
	
	
	// localhost:8080/jdbc/comp/insert로 호출되는 함수
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		// WEB-INF/views/comp/input.jsp 열어라
		return "comp/input";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(CompVO cmVO) {
		
		log.debug("Company VO {}", cmVO.toString());
		compService.insert(cmVO);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update() {
		
		return "comp/input";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("cp_code") String cpCode) {
		// @RequestParam("가져올데이터명") 그것을 cpCode라는 이름으로 쓰겠다. 이렇게 안쓰고 그냥 String cp_code 해도 됨
		compDao.delete(cpCode);
		return "redirect:/";
	}

}
