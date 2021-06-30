package com.callor.book.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.book.model.BookDTO;
import com.callor.book.service.NaverBookService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class HomeController {
	// naverServiceV1과 V2를 넘나드는
	@Qualifier("naverServiceV2")
	protected final NaverBookService<BookDTO> nBookService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/naver/BOOK";
	}
	
	
	// 여기서부터 연습용코드?
	@RequestMapping(value = "/not", method = RequestMethod.GET)
	public String home(
			@RequestParam(name = "category", required = false, defaultValue = "") String category, Model model) {
		
		// model.addAttribute("CAT", category);
		if(category.equalsIgnoreCase("BOOK")) {
			return "redirect:/book";
		} else if ( category.equalsIgnoreCase("MOVIE")) {
			return "redirect:/movie";
		} else if ( category.equalsIgnoreCase("NEWS")) {
			return "redirect:/news";
		}
		return "redirect:/book";
	}
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home1(@RequestParam(name = "search", required = false, defaultValue = "") String search, Model model) throws MalformedURLException, IOException, ParseException {
		
		// search 변수가 null값이 아니고(혹시 모를 exception 방지를 위해), 빈값이 아니면 => 값이 담겨있으면
		if(search != null && !search.equals("")) {
			
			String queryURL = nBookService.queryURL(search.trim());
			String jsonString = nBookService.getJsonString(queryURL);
			List<BookDTO> bookList = nBookService.getNaverList(jsonString);
			model.addAttribute("BOOKS", bookList);
			
		}
		
		return "home";
	}
	
}
