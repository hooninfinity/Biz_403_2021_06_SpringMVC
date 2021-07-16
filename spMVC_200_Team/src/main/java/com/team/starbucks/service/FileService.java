package com.team.starbucks.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface FileService {
//	1개 파일업로드
	public String fileUp(MultipartFile one_file) throws Exception;
//	다수파일업로드
//	public List<String> filesUp(MultipartHttpServletRequest files) throws Exception;
	
}