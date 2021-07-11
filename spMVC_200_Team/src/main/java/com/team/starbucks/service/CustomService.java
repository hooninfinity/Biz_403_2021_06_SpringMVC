package com.team.starbucks.service;

import java.util.List;

import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;
import com.team.starbucks.model.CustomVO;

public interface CustomService{

	public List<CustomDTO> selectAll();
	public List<CategoryDTO> findByMenukinds(int menu_kinds);
	public List<CategoryDTO> findBybase1();
	public List<CategoryDTO> findBymenuCode(int menu_code);
	public int insert(CustomVO cuVO);
	public CategoryDTO findByMenuName(int menu_code);
}