package com.team.starbucks.dao.ext;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.starbucks.dao.GenericDao;
import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;

public interface CustomDao extends GenericDao<CustomDTO, String> {

	public CustomDTO findBySeq(Long menu_seq);

	public List<CategoryDTO> findBycode(String menu_codes);

	public List<CustomDTO> findBySearch(@Param("column") String search_column, @Param("text") String search_text);
}