package com.team.startea.dao;

import java.util.List;

public interface GenericDao<VO, PK> {
	
	public List<VO> selectAll();
	public VO findById(String PK);
	
	public int insert(VO vo);
	public int update(VO vo);
	public int delete(PK pk);

}
