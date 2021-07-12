package com.team.starbucks.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;
import com.team.starbucks.model.CustomVO;
import com.team.starbucks.model.UserVO;
import com.team.starbucks.service.CustomService;
import com.team.starbucks.service.FileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping(value = "/custom")
public class CustomController {

	@Qualifier("customServiceV1")
	protected final CustomService cuService;
	@Qualifier("fileServiceV1")
	protected final FileService fService;

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String list(HttpSession session, Model model, CustomVO customVO) {

		UserVO userVO = (UserVO) session.getAttribute("USER");
		List<CustomDTO> cuList = cuService.selectAll();
		model.addAttribute("CustomList", cuList);
		log.debug("Custom root");

		return "custom/list";
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String insert(Model model) {
		List<CategoryDTO> menukindsList = cuService.findBybase1();
		log.debug("menuKinds{}", menukindsList.toString());
		model.addAttribute("BASE1", menukindsList);
		return "custom/input";
	}

	@RequestMapping(value = "/input2", method = RequestMethod.GET)
		public String insert2(@RequestParam("menukinds") int menu_kinds,Model model) {
 		List<CategoryDTO> menukindsList = cuService.findByMenukinds(menu_kinds);
		log.debug("munukindsList {}", menukindsList.toString());
		model.addAttribute("KINDS", menukindsList);
		return "custom/input2";
	}

//	@RequestMapping(value = "/save", method = RequestMethod.GET)
//	public String saveMenu(Model model, @RequestParam("menucode") int menu_code) {
//	
//		return "custom/input";
//	}
	
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveMenu(@RequestParam("menucode") int menu_code,Model model) {
		CategoryDTO cateDto = cuService.findByMenuName(menu_code);
		model.addAttribute("CHOISEMENU", cateDto);
		log.debug(cateDto.toString());
		return "custom/save";
	}
// 여기가 원본
//	@RequestMapping(value = "/save", method = RequestMethod.POST)
//	public String saveMenu(@RequestParam("menucode") Long menu_code,CustomVO cuVO,Model model) {
//		log.debug(menu_code + "");
//		Long menu_seq = 0L;
//		cuVO.setMenu_code(menu_code);
//		
//		log.debug(cuVO.toString());
//		cuService.insert(cuVO);
//		
//		return "redirect:/custom";
//	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveMenu(@RequestParam("menucode") Long menu_code,CustomVO cuVO,Model model,
			MultipartFile one_file, MultipartHttpServletRequest m_file) throws Exception {
		log.debug(menu_code + "");
		Long menu_seq = 0L;
		cuVO.setMenu_code(menu_code);
		
		log.debug(cuVO.toString());
		cuService.input(cuVO, one_file, m_file);
		
		return "redirect:/custom";
	}

	
	
	
	
	
	
	
	
//	@RequestMapping(value = "/test", method = RequestMethod.GET)
//	public String dumy(Model model) {
//		List<CategoryDTO> allCate = cuService.findBybase1();
//		log.debug(" allCate {}", allCate.toString());
//		model.addAttribute("BASE1", allCate);
//
//		for (int i = 0; i < allCate.size(); i++) {
//			log.debug("검색된메뉴 {}", cuService.findByMenukinds(i));
//			List<CategoryDTO> onekinds = cuService.findByMenukinds(i);
//			log.debug("oneKinds {}", onekinds.toString());
//		}
//		return "custom/test";
//	}

}