package com.team.starbucks.dao.ext;

import java.util.List;

import com.team.starbucks.dao.GenericDao;
import com.team.starbucks.model.CategoryDTO;

public interface CategoryDao extends GenericDao<CategoryDTO,String>{

	public List<CategoryDTO> findByMenukinds(Long menu_kinds);
	public List<CategoryDTO> findBybase1();
	public List<CategoryDTO> findBycode(Long menu_code);
	public CategoryDTO findById(Long cate_code);
	public CategoryDTO findByMenuName(Long cate_code);
	public String findByCodeName(Long menu_code);
	
}
