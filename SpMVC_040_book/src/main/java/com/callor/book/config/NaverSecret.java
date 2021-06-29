package com.callor.book.config;

public class NaverSecret {
	
	/*
	 * 네이버 개발자 센터에 어플을 등록한 후
	 * CLIENT_ID, CLIENT_SECRET를 발급받아
	 * 다음 항목에 작성한 후
	 * 파일 이름을 NaverSecret로 변경한 후
	 * 프로젝트를 실행하시오
	 */
	public static final String NAVER_CLIENT_ID = "S5egTiwHWwp6au8ZYuQn";
	public static final String NAVER_CLIENT_SECRET = "TYYBr0B17B";
	
	public static class NURL {
		public static final String BOOK = "https://openapi.naver.com/v1/search/book.json";
		public static final String NEWS = "https://openapi.naver.com/v1/search/news.json";
		public static final String MOVIE = "https://openapi.naver.com/v1/search/movie.json";
	}

}
