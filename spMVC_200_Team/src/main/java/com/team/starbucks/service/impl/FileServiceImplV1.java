package com.team.starbucks.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.starbucks.model.CustomDTO;
import com.team.starbucks.service.FileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("fileServiceV1")
public class FileServiceImplV1 implements FileService {

	protected final String winPath;
	protected final String macPath;

	protected String fileUpPath;

	@Autowired
	public void getFilePath(String winPath, String macPath) {
		/*
		 * 파일을 업로드 할때 사용할 path 가져오기
		 * 
		 * 1. 지정된 폴더를 윈도우 기반의 폴더로 설정
		 * 2. mac 기반의 폴더가 있으면 해당 폴더로 변경
		 */
		this.fileUpPath = this.winPath;
	}

	@Override
	public String fileUp(MultipartFile file) throws Exception {
		// 기본파일을 선택하지 않으면 noImage 뜨도록 
		String originFileName = file.getOriginalFilename();
		if (originFileName == null || originFileName.isEmpty())
			return "";

		// 현재 시스템에 macPath로 설정된 폴더가 있는지 확인하고
		// 있으면 업로드 폴더를 macPath에서 지정된 값으로 설정하기
		File path = new File(macPath);
		if (path.exists()) {
			this.fileUpPath = this.macPath;
		}

		// 다시한번 filePath 가 있는지 검사
		// winPath일 경우는 폴더를 만들어라
		path = new File(fileUpPath);
		if (!path.exists()) {
			path.mkdirs();
		}

		String strUUID = UUID.randomUUID().toString();
		strUUID += originFileName;

		File uploadPathAndFile = new File(fileUpPath, strUUID);
		file.transferTo(uploadPathAndFile);
		return strUUID;
	}

	public int delete(String imgFileName) {
		if (imgFileName == null || imgFileName.isEmpty()) {
			return 1;
		}
		//	CustomDTO cusDTO = cusDao.findBySeq(seq);
		//		cateDao.delete(seq);
		File delFile = new File(this.fileUpPath, imgFileName);

		if (delFile.exists()) {
			boolean ok = delFile.delete();
			if (ok) {
				log.debug("파일 삭제 완료");

			} else {
				log.debug("파일삭제 실패");
				return -1;
			}
		}
		return 1;

	}
}