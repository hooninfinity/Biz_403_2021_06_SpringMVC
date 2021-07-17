package com.team.starbucks.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;

public interface CustomService{
	public List<CustomDTO> selectAll();
	public List<CategoryDTO> findByMenukinds(Long menu_kinds);
	public List<CategoryDTO> findBybase1();
	public List<CategoryDTO> findBymenuCode(Long menu_code);
	public CategoryDTO findByMenuName(Long menu_code); 
	public String findByCodeName(Long menu_code);
	
	public void input(CustomDTO cuDTO,MultipartFile one_file) throws Exception;
	public CustomDTO findBySeq(Long menu_seq);
	
	public CustomDTO findBySearch(String search, String column,Model model);
	public List<CustomDTO> findByUser_id(String user_id);
	
	public int delete(Long seq);
	public void update(Long seq);

}