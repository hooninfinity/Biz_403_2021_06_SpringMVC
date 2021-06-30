package com.callor.book.service.impl.movie;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.callor.book.config.NaverSecret;
import com.callor.book.model.MovieDTO;
import com.callor.book.service.NaverMovieService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("naverMovieServiceV1")
public class NaverMovieServiceImplV1 implements NaverMovieService {

	/*
	 * naver에 요청하기 MovieURL + "?query=" + 검색문자열
	 */
	@Override
	public String queryURL(String search_text) {
		
		// 검색하고자 하는 문자열을 UTF-8로 인코딩
		String searchUTF8 = null;
		try {
			searchUTF8 = URLEncoder.encode(search_text, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		StringBuilder queryURL = new StringBuilder();
		queryURL.append(NaverSecret.NURL.MOVIE);
		
		String queryString = String.format("?query=%s", searchUTF8);
		queryURL.append(queryString);
		queryString = String.format("&display=%d", 20);
		queryURL.append(queryString);
		log.debug("queryURL {} ", queryURL.toString());
		return queryURL.toString();
	}

	/*
	 * queryURL을 naver에 전송하고 naver로부터 결과를 받는 method
	 */
	@Override
	public String getJsonString(String queryURL) throws MalformedURLException, IOException {

		// API를 통하여 다른 서버에 Request를 보낼때 사용할 객체
		URL url = null;
		
		// Http 프로토콜을 통하여 다른 서버에 연결할때 사용할 객체
		HttpURLConnection httpConn = null;
		
		// queryURL 주소를 Request 정보로 변환
		url = new URL(queryURL);
		
		// 생성된 URL 정보를 사용하여 다른 서버에 연결
		httpConn = (HttpURLConnection) url.openConnection();
		
		// 요청하는 method GET으로 설정하기
		httpConn.setRequestMethod("GET");
		
		httpConn.setRequestProperty("X-Naver-Client-Id", NaverSecret.NAVER_CLIENT_ID);
		httpConn.setRequestProperty("X-Naver-Client-Secret", NaverSecret.NAVER_CLIENT_SECRET);
		
		// naver 가 어떤 응답을 할 것인지 미리 확인하는 코드를 요청한다
		int httpStatusCode = httpConn.getResponseCode();
		
		// naver로부터 데이터를 수신할 객체
		InputStreamReader is = null;
		if (httpStatusCode == 200) {
			is = new InputStreamReader(httpConn.getInputStream());
		} else {
			is = new InputStreamReader(httpConn.getErrorStream());
		}
		
		// is를 buffer에 연결
		BufferedReader buffer = null;
		buffer = new BufferedReader(is);
		
		// StringBuffer : append라는 메소드를 이용해 문자열을 계속 추가할 수 있다
		StringBuffer sBuffer = new StringBuffer();
		
		// 가져온 데이터를 읽어서 변수에 담기
		while (true) {
			String reader = buffer.readLine();
			if (reader == null) {
				break;
			}
			sBuffer.append(reader);
		}
		return sBuffer.toString();
	}

	/*
	 * 네이버에서 받은 JSonString을 parsing하여 List<MovieDTO>에 담아서 return
	 * 
	 * json-simple을 사용하여 parsing하기
	 */
	@Override
	public List<MovieDTO> getNaverList(String jsonString) throws ParseException {

		log.debug("나는 MovieServiceV1 이로소이다");
		
		// 1. json Parsing 도구 선언
		JSONParser jPaser = new JSONParser();
		
		// JsonString을 JSON 객체로 변환
		JSONObject jObject = (JSONObject) jPaser.parse(jsonString);
		
		// parsing된 JSON 객체에서 items 항목을 추출하여
		// JSON 배열 타입으로 변환하기(내부적으로는 List)
		JSONArray items = (JSONArray) jObject.get("items");
		
		List<MovieDTO> movieList = new ArrayList<MovieDTO>();
		
		int nSize = items.size();
		for (int i = 0 ; i < nSize ; i++) {
			
			
			
			
			
		}
		
		
		
		
		
		
		
		
		return null;
	}

}












