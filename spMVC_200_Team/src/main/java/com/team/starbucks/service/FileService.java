package com.team.starbucks.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
//	1개 파일업로드
	public String fileUp(MultipartFile one_file) throws Exception;
//	다수파일업로드
//	public List<String> filesUp(MultipartHttpServletRequest files) throws Exception;
	
	// 첨부된 파일을 삭제하기 위한 method
	public int delete(String imgFileName);
	
}