package com.team.starbucks.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
//	1개 파일업로드
	public String fileUp(MultipartFile one_file) throws Exception;
//	다수파일업로드
//	public List<String> filesUp(MultipartHttpServletRequest files) throws Exception;

	public int delete(String imgFileName) throws Exception;
	
}