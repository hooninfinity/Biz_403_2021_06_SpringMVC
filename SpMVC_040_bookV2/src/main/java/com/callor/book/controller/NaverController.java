package com.callor.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.book.config.NaverQualifier;
import com.callor.book.model.NewsDTO;
import com.callor.book.service.impl.NaverMainService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/naver")
@Controller
public class NaverController {

	@Qualifier(NaverQualifier.NAVER_MAIN_SERVICE_V1)
	protected final NaverMainService nService;

	/*
	 * web client에서 서버로 Request를 할때
	 * 어떤 데이터를 보내는 방법
	 * 
	 * 1. queryString
	 * ?변수=값 : GET method 방법으로 queryString 으로 데이터 보내기
	 * ?username=callor&pw=12345
	 * 
	 * 2. request Body에 담아 보내는 방법
	 * <form method=POST><input username>
	 * 
	 * 3. url Path(Path Variable) 방식 : url 주소처럼 변수를 실어보내는 방법. 가장 최신기술
	 * http://localhost:8080/book/naver/korea
	 * http://localhost:8080/book/naver/callor/12345
	 * Mapping(value="/naver/{username}/{password}
	 */
	@RequestMapping(value = "/{CAT}", method = RequestMethod.GET)
	public String home(@PathVariable(name = "CAT") String cat,
			@RequestParam(name = "search", required = false, defaultValue = "") String search, Model model)
			throws Exception {

		log.debug("CAT {}", cat);
		model.addAttribute("CAT", cat);

		nService.naverGetData(cat, search, model);
		return "home";
	}

	/*
	 * produces = "application/json;char=UTF8"
	 * 일반적인 문자열이 아닌
	 * JSON 형태의 String을 보내니
	 * 표시할 때 JSON 타입을 인식하여 보여라 라는 지시어
	 * 이 지시어를 추가하지 않으면
	 * return type이 String 이기 때문에 단순 문자열로 처리해 버린다.
	 */
	@ResponseBody
	@RequestMapping(value = "/get/json", method = RequestMethod.GET, produces = "application/json;char=UTF8")
	public String getJson() throws Exception {
		
		String cat = "NEWS";
		String search = "COVID";
		String jsonString = nService.naverGetJsonString(cat, search);
		return jsonString;
	}
	
	@ResponseBody
	@RequestMapping(value = "/get/list")
	public List<NewsDTO> getNews(String search) throws Exception {
		return nService.naverGetList(search);
	}

}
