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
		String originalFileName = file.getOriginalFilename();
		if (originalFileName == null || originalFileName.isEmpty())
			return "";

		String fileUploadPath = this.winPath;
		
		File path = new File(winPath);
		if (path.exists()) {
			fileUploadPath = this.macPath;
		}
		path = new File(fileUploadPath);

		if(!path.exists()) {
			path.mkdir();
		}
		
		String strUUID = UUID.randomUUID().toString();
		strUUID += originalFileName;
		
		File upLoadPathAndFile = new File(fileUploadPath, strUUID);
		file.transferTo(upLoadPathAndFile);
		
		return strUUID;
	}

}