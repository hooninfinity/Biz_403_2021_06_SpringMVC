package com.team.starbucks.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.starbucks.model.BoardDTO;
import com.team.starbucks.model.UserVO;
import com.team.starbucks.service.BoardService;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@RequestMapping(value = "/board")
@Controller
public class BoardController {
	
	@Qualifier("boardServiceV1")
	protected final BoardService bdService;
	
	@RequestMapping(value = {"","/"}, method= RequestMethod.GET)
	public String selectAll(Model model) {
		List<BoardDTO> bdList = bdService.selectAll();
		model.addAttribute("BOARD_LIST", bdList);
		return "board/list";
	}

	
	@RequestMapping(value = "/input/{board_code}", method=RequestMethod.POST)
	public String insert(@PathVariable("board_code") Model model, HttpSession session) {
		UserVO userVO =(UserVO) session.getAttribute("USER");
		if(userVO == null) {
			return "redirect:/user/login";
		}
		return null;
	}
	@RequestMapping(value = "/input", method=RequestMethod.GET)
	public String insert() {
		
		return null;
		
	}
}
