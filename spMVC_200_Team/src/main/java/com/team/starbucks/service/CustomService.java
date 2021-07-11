package com.team.starbucks.service;

import java.util.List;

import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;

public interface CustomService{

	public List<CustomDTO> selectAll();
	public List<CategoryDTO> findByMenukinds(int menu_kinds);
	public List<CategoryDTO> findBybase1();
}