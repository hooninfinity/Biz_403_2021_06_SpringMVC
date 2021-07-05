package com.team.starbucks.dao;

import java.util.List;

public interface GenericDao<VO, PK> {

	public List<VO> selectAll();
	public VO findById(PK pk);
	public List<VO> ListBySearch(String search);
	
	public int insert(VO vo);
	public int update(VO vo);
	public int delete(VO vo);
	
	
}
