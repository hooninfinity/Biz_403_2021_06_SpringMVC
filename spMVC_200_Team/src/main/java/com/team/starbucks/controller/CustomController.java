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

import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;
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
	public String list(HttpSession session, Model model, CustomDTO customDTO) {

		List<CustomDTO> cuList = cuService.selectAll();
		model.addAttribute("BODY", "CUSTOM_LIST");
		model.addAttribute("CustomList", cuList);
		log.debug("Custom root");
		return "home";
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String insert(Model model) {
		List<CategoryDTO> menukindsList = cuService.findBybase1();
		log.debug("menuKinds{}", menukindsList.toString());
		
		model.addAttribute("BODY", "INPUT-HOME");
		model.addAttribute("BASE1", menukindsList);
//		return "custom/input";
		return "home";
	}
	

	@RequestMapping(value = "/input2", method = RequestMethod.GET)
	public String insert2(@RequestParam("menukinds") int menu_kinds, Model model) {
		List<CategoryDTO> menukindsList = cuService.findByMenukinds(menu_kinds);
		log.debug("munukindsList {}", menukindsList.toString());
		model.addAttribute("BODY", "INPUT-KINDS");
		model.addAttribute("KINDS", menukindsList);
//		return "custom/input2";
		return "home";
	}

	//	@RequestMapping(value = "/save", method = RequestMethod.GET)
	//	public String saveMenu(Model model, @RequestParam("menucode") int menu_code) {
	//	
	//		return "custom/input";
	//	}

	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveMenu(@RequestParam("menucode") int menu_code, Model model) {
		CategoryDTO cateDto = cuService.findByMenuName(menu_code);
		model.addAttribute("BODY", "INPUT-SAVE");
		model.addAttribute("CHOISEMENU", cateDto);
		log.debug(cateDto.toString());
//		return "custom/save";
		return "home";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveMenu(@RequestParam("menucode") Long menu_code, CustomDTO cuDTO, Model model, MultipartFile one_file)
			throws Exception {
		log.debug(menu_code + "");
		Long menu_seq = 0L;
		cuDTO.setMenu_seq(menu_seq);
		cuDTO.setMenu_code(menu_code);
		log.debug("싱글 파일 {}", one_file.getOriginalFilename());
		log.debug("갤러리 정보 {}", cuDTO.toString());
		cuService.input(cuDTO, one_file);
		return "redirect:/custom";
	}
	

}


