package com.team.starbucks.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team.starbucks.dao.ext.BoardDao;
import com.team.starbucks.model.BoardDTO;
import com.team.starbucks.service.BoardService;
import com.team.starbucks.service.FileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service("boardServiceV1")
public class BoardServiceImplV1 implements BoardService {

	protected final BoardDao bdDao;
	@Qualifier("fileServiceV1")
	protected final FileService fService;

	@Override
	public List<BoardDTO> selectAll() {
		
		log.debug("리스트목록 {} ", bdDao.toString());
		List<BoardDTO> bdList = bdDao.selectAll();
		
		return bdList;
	}

}
