package com.callor.gallery.persistance;

import java.util.List;
import java.util.Map;

public interface GenericDao<VO, PK> {
	
	public List<VO> selectAll();
	
	// dao 와 mapper가 연결될때 변수가 한개면 변수명이 중요하지 않다
	public VO findById(PK pk);
	
	public int insert(VO vo);
	public int update(VO vo);
	public int delete(PK pk);
	
	public int create_table(Map<String,String> resultMaps);
	
	

}
