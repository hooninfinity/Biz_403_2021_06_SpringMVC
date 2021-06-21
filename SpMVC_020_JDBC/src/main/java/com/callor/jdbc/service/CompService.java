package com.callor.jdbc.service;

import java.util.List;

import com.callor.jdbc.model.CompVO;

public interface CompService {
	
	public int insert(CompVO vo);
	public List<CompVO> findByCname(String cp_name); // 이름으로 검색하기
	public List<CompVO> selectAll();
	public CompVO findByCCode(String cp_code);

}
