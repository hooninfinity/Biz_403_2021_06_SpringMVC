package com.callor.score.persistence;

import java.util.List;

import com.callor.score.model.StudentDTO;

public interface GenericDao<VO, PK> {
	
	public List<StudentDTO> selectAll();
	public VO findById(PK pk);
	public int insert(VO vo);
	public int update(VO vo);
	public int delete(PK pk);


}
