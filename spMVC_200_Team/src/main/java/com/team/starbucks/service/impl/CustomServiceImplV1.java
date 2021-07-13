package com.team.starbucks.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.starbucks.dao.ext.CategoryDao;
import com.team.starbucks.dao.ext.CustomDao;
import com.team.starbucks.dao.ext.FileDao;
import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;
import com.team.starbucks.model.CustomVO;
import com.team.starbucks.model.FileDTO;
import com.team.starbucks.service.CustomService;
import com.team.starbucks.service.FileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("customServiceV1")
public class CustomServiceImplV1 implements CustomService {

	protected final CategoryDao cateDao;
	protected final CustomDao cusDao;
	protected final FileDao fDao;
	
	@Qualifier("fileServiceV1")
	protected final FileService fService;

	@Autowired
	public void create_table() {
		Map<String,String> maps = new HashMap<String, String>();
		cusDao.create_table(maps);
		fDao.create_table(maps);
	}
	
	@Override
	public List<CustomDTO> selectAll() {
		return cusDao.selectAll();
	}

	public String detail(Model model, Long menu_seq, Long file_seq) {

		CustomDTO customDTO = cusDao.findById(menu_seq);
		FileDTO fileDTO = fDao.findById(file_seq);

		return null;
	}

	public int insert(CustomVO customVO) {
		return cusDao.insert(customVO);
	}

	public int update(CustomVO customVO) {
		return cusDao.update(customVO);
	}

	public int delete(CustomVO customVO) {
		return cusDao.delete(customVO);

	}

	@Override
	public List<CategoryDTO> findByMenukinds(int menu_kinds) {
		// TODO Auto-generated method stub
		List<CategoryDTO> bsList = cateDao.findByMenukinds(menu_kinds);
		log.debug("bsList {} ", bsList.toString());
		return bsList;
	}

	@Override
	public List<CategoryDTO> findBybase1() {
		return cateDao.findBybase1();
	}

	@Override
	public List<CategoryDTO> findBymenuCode(int menu_code) {
		return cateDao.findBycode(menu_code);
	}

	@Override
	public CategoryDTO findByMenuName(int menu_code) {
		// TODO Auto-generated method stub
		return cateDao.findById(menu_code);
	}


	@Override
	public void input(CustomVO cuVO, MultipartFile one_file)
			throws Exception {
		// TODO Auto-generated method stub
		FileDTO fDto = new FileDTO();
		String strUUID = fService.fileUp(one_file);
		
		log.debug("strUUID {}", strUUID);
		
		fDto.setFile_seq(0L);
		fDto.setFile_originalName(one_file.getOriginalFilename());
		fDto.setFile_upname(strUUID);
		log.debug("저장파일정보 {}",fDto.toString());
		fDao.insertORUpdate(fDto);
		cusDao.insert(cuVO);

	
	
	}


}