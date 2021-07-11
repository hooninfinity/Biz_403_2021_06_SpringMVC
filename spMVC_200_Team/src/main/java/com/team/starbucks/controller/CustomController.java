package com.team.starbucks.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String base1(Model model) {
		List<CategoryDTO> menukindsList = cuService.findBybase1();
		log.debug("menuKinds{}", menukindsList.toString());
		model.addAttribute("BASE1", menukindsList);
		return "custom/input";

	}

	@RequestMapping(value = "/input/base1", method = RequestMethod.GET)
	public String insert(@RequestParam("menukinds") int menu_kinds, Model model) {
		List<CategoryDTO> menukindsList = cuService.findByMenukinds(menu_kinds);
		log.debug("munukindsList {}", menukindsList.toString());
		model.addAttribute("KINDS", menukindsList);
		return "custom/base2";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String saveMenu(Model model, @RequestParam("menucode") int menu_code) {
		CategoryDTO cateDto = cuService.findByMenuName(menu_code);
		log.debug(cateDto.toString());
		model.addAttribute("CHOISEMENU", cateDto);
		return "custom/input";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public int saveMenu(@RequestParam("menucode") int menu_code, CustomVO cuVO) {
		cuVO.builder().menu_code(menu_code).menu_option(cuVO.getMenu_option()).menu_title(cuVO.getMenu_title())
				.menu_img(cuVO.getMenu_img()).user_id(cuVO.getUser_id()).build();
		log.debug(cuVO.toString());
		return cuService.insert(cuVO);
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String dumy(Model model) {
		List<CategoryDTO> allCate = cuService.findBybase1();
		log.debug(" allCate {}", allCate.toString());
		model.addAttribute("BASE1", allCate);
//
//		
//		List<CategoryDTO> menukindsList = cuService.findByMenukinds(cateVO.getMenu_kinds());
//		log.debug("munukindsList {}", menukindsList.toString());
//		model.addAttribute("KINDS", menukindsList);
//
//		CategoryDTO cateDto = cuService.findByMenuName(cateVO.getMenu_code());
//		log.debug(cateDto.toString());
//		model.addAttribute("CHOISEMENU", cateDto);

		return "custom/test";
	}

}