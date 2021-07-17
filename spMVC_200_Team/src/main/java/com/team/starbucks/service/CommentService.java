package com.team.starbucks.service;

import java.util.List;

import org.springframework.ui.Model;

import com.team.starbucks.model.CommentDTO;

public interface CommentService {

	public List<CommentDTO> selectByMenuseq(Long menu_seq,Model model);

	public int insert(CommentDTO commentDTO);
	
}
