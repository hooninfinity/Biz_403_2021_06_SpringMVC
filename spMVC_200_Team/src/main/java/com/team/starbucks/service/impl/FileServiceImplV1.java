package com.team.starbucks.service.impl;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team.starbucks.service.FileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("fileServiceV1")
public class FileServiceImplV1 implements FileService {
	
	protected final String winPath;
	protected final String macPath;

	@Override
	public String fileUp(MultipartFile file) throws Exception {
		String originFileName = file.getOriginalFilename();
		if (originFileName == null || originFileName.isEmpty())
			return "";

		String fileUpPath = this.winPath;
		
		File path = new File(macPath);
		if (path.exists()) {
			fileUpPath = this.macPath;
		}
		
		path = new File(fileUpPath);
		if(!path.exists()) {
			path.mkdir();
		}
		
		String strUUID = UUID.randomUUID().toString();
		strUUID += originFileName;
		
		File uploadPathAndFile = new File(fileUpPath, strUUID);
		file.transferTo(uploadPathAndFile);
		
		return strUUID;
	}

}