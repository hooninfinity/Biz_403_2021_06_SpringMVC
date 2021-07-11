package com.team.starbucks.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.starbucks.dao.ext.CategoryDao;
import com.team.starbucks.dao.ext.CustomDao;
import com.team.starbucks.dao.ext.FileDao;
import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;
import com.team.starbucks.model.CustomVO;
import com.team.starbucks.model.FileDTO;
import com.team.starbucks.service.CustomService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("customServiceV1")
public class CustomServiceImplV1 implements CustomService {

	protected final CategoryDao cateDao;
	protected final CustomDao cusDao;
	protected final FileDao fDao;

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
	

}