package com.team.starbucks.dao.ext;

import java.util.List;

import com.team.starbucks.dao.GenericDao;
import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;
import com.team.starbucks.model.CustomVO;

public interface CustomDao extends GenericDao<CustomDTO,String>{

	public CustomDTO findById(Long menu_seq);
	public List<CategoryDTO> findBycode();
	public int create_table();
	public int insert(CustomVO customVO);
	public int update(CustomVO customVO);
	public int delete(CustomVO customVO);
	
}