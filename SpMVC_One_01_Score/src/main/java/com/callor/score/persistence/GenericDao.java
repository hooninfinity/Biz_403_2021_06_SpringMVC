package com.callor.score.persistence;

import java.util.List;

public interface GenericDao<VO, PK> {
	
	public List<VO> selectAll();
	public VO findById(PK pk);
	public int insert();
	public int update();
	public int delete();

}
