package com.team.starbucks.dao.ext;

import java.util.List;

import com.team.starbucks.dao.GenericDao;
import com.team.starbucks.model.CategoryDTO;

public interface CategoryDao extends GenericDao<CategoryDTO,String>{

	public List<CategoryDTO> findByMenukinds(int menu_kinds);
	public List<CategoryDTO> findBybase1();
	public List<CategoryDTO> findBycode(int menu_code);
	public CategoryDTO findById(int cate_code);
}