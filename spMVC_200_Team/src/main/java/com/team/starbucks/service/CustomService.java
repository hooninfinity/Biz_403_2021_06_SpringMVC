package com.team.starbucks.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;

public interface CustomService{

	public List<CustomDTO> selectAll();
	public List<CategoryDTO> findByMenukinds(int menu_kinds);
	public List<CategoryDTO> findBybase1();
	public List<CategoryDTO> findBymenuCode(int menu_code);
	public CategoryDTO findByMenuName(int menu_code);
	
	public void input(CustomDTO cuDTO,MultipartFile one_file) throws Exception;
	

}