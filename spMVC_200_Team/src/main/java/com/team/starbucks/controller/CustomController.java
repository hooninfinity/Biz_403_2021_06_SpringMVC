package com.team.starbucks.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.team.starbucks.model.CommentDTO;
import com.team.starbucks.model.CustomDTO;
import com.team.starbucks.model.UserVO;
import com.team.starbucks.service.CommentService;
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
	@Qualifier("commentServiceV1")
	protected final CommentService comService;

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String list(HttpSession session, Model model, CustomDTO customDTO) {
		List<CustomDTO> cuList = cuService.selectAll();
		model.addAttribute("CustomList", cuList);
		model.addAttribute("BODY", "CUSTOM-LIST");
		return "home";
	}

	@RequestMapping(value = "/smallList", method = RequestMethod.GET)
	public String smalllist(Model model, CustomDTO customDTO) {

		List<CustomDTO> cuList = cuService.selectAll();
		model.addAttribute("CustomList", cuList);
		//		model.addAttribute("BODY", "CUSTOM_LIST");
		return "home";
	}

	@RequestMapping(value = "/mylist", method = RequestMethod.GET)
	public String myList(Model model, HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("LOGIN");
		if (userVO == null) {
			return "redirect:/user/login";
		} else {
		List<CustomDTO> myList = cuService.findByUser_id(userVO.getUser_id());
		model.addAttribute("USERVO", userVO);
		model.addAttribute("MYLIST", myList);
		model.addAttribute("BODY", "CUSTOM-MYLIST");
		return "home";
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("menu_seq") Long menu_seq, Model model, HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("LOGIN");
		if (userVO == null) {
			return "redirect:/user/login";
		} else {
			CustomDTO customDTO = cuService.findBySeq(menu_seq);
			//			필요한것 menu_seq, User_id,  comment_seq, comment	
			
			List<CommentDTO> comList =comService.selectByMenuseq(menu_seq, model); 
			model.addAttribute("COMMENT", comList);
			model.addAttribute("SECTION", "COMMENT");

			model.addAttribute("DETAIL", customDTO);
			model.addAttribute("BODY", "CUSTOM-DETAIL");

			log.debug("Detail {} ", customDTO.toString());
			return "home";

		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String comment(@RequestParam("menu_seq") Long menu_seq, CommentDTO commentDTO, HttpSession session,Model model) {
		UserVO userVO = (UserVO) session.getAttribute("LOGIN");
	
		String userId = userVO.getUser_id();

		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String curDate = sd.format(date);
		log.debug("시간정보 : {}", curDate);
		commentDTO.setDate(curDate);
		commentDTO.setUser_id(userId);
		commentDTO.setMenu_seq(menu_seq);
		log.debug("commetDTO", commentDTO.toString());
		int ret = comService.insert(commentDTO);
		model.addAttribute("SECTION", "COMMENT");
		if (ret > 0) {

			return "redirect:/";
		}
		return "redirect:/";
		}
	
	@RequestMapping(value="/delete",method = RequestMethod.GET)
	public String customDelete(@RequestParam("menu_seq") Long menu_seq,HttpSession session,Model model) throws Exception {
		UserVO userVO = (UserVO) session.getAttribute("LOGIN");
		if (userVO == null) {
			return "redirect:/user/login";
		}
		cuService.delete(menu_seq, model);
	 return "redirect:/custom/mylist";	
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(
			@RequestParam(value = "search_column", required = false, defaultValue = "NONE") String search_column,
			@RequestParam(value = "search_text", required = false, defaultValue = "NONE") String search_text,
			Model model) {
		cuService.findBySearch(search_text, search_column, model);
		model.addAttribute("SEARCH", model);
		model.addAttribute("BODY", "SEARCH-LIST");
		return "home";
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String insert(Model model, HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("LOGIN");
		if (userVO == null) {
			return "redirect:/user/login";
		}
		List<CategoryDTO> menukindsList = cuService.findBybase1();
		//		log.debug("menuKinds{}", menukindsList.toString());

		model.addAttribute("BODY", "INPUT-HOME");
		model.addAttribute("BASE1", menukindsList);
		//		return "custom/input";
		return "home";
	}

	@RequestMapping(value = "/input2", method = RequestMethod.GET)
	public String insert2(@RequestParam("menukinds") Long menu_kinds, Model model, HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("LOGIN");
		if (userVO == null) {
			return "redirect:/user/login";
		} else {
			List<CategoryDTO> menukindsList = cuService.findByMenukinds(menu_kinds);
			//		log.debug("munukindsList {}", menukindsList.toString());
			model.addAttribute("BODY", "INPUT-KINDS");
			model.addAttribute("KINDS", menukindsList);
			//		return "custom/input2";
			return "home";

		}
	}

	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveMenu(@RequestParam("menucode") Long menu_code, Model model, HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("LOGIN");
		if (userVO == null) {
			return "redirect:/user/login";
		}
		log.debug(userVO.toString());
		String userId = userVO.getUser_id();
		log.debug(userId);
		model.addAttribute("USER", userId);
		CategoryDTO cateDTO = cuService.findByMenuName(menu_code);
		model.addAttribute("BODY", "INPUT-SAVE");
		model.addAttribute("CHOISEMENU", cateDTO);
		log.debug(cateDTO.toString());
		return "home";

	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveMenu(@RequestParam("menucode") Long menu_code, CustomDTO cuDTO, Model model,
			MultipartFile one_file, HttpSession session) throws Exception {
		UserVO userVO = (UserVO) session.getAttribute("LOGIN");
		if (userVO == null) {
			return "redirect:/user/login";
		}
		log.debug(userVO.toString());
		String userId = userVO.getUser_id();
		log.debug("저장할 아이디 {}", userVO.toString());
		Long menu_seq = 0L;
		String menu_name = cuService.findByCodeName(menu_code);
		cuDTO.setMenu_seq(menu_seq);
		cuDTO.setMenu_code(menu_code);
		cuDTO.setMenu_name(menu_name);
		cuDTO.setUser_id(userId);
		log.debug("싱글 파일 {}", one_file.getOriginalFilename());
		log.debug("갤러리 정보 {}", cuDTO.toString());
		cuService.input(cuDTO, one_file);
		return "redirect:/custom";
	}

}