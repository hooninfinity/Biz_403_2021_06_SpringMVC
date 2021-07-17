package com.team.starbucks.dao.ext;

import java.util.List;

import com.team.starbucks.dao.GenericDao;
import com.team.starbucks.model.CommentDTO;

public interface CommentDao extends GenericDao<CommentDTO,Long>{

	
	public List<CommentDTO> selectByMenuseq(Long menu_seq);
	
}
