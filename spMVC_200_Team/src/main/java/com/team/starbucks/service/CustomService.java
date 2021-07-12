package com.team.starbucks.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;
import com.team.starbucks.model.CustomVO;

public interface CustomService{

	public List<CustomDTO> selectAll();
	public List<CategoryDTO> findByMenukinds(int menu_kinds);
	public List<CategoryDTO> findBybase1();
	public List<CategoryDTO> findBymenuCode(int menu_code);
	public CategoryDTO findByMenuName(int menu_code);
//	public int insert(CustomVO cuVO);
	public void input(CustomVO cuVO, MultipartFile one_file, MultipartHttpServletRequest m_file) throws Exception;
}