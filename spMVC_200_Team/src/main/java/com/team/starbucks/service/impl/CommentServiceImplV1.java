package com.team.starbucks.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.starbucks.dao.ext.CommentDao;
import com.team.starbucks.model.CommentDTO;
import com.team.starbucks.service.CommentService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service("commentServiceV1")
public class CommentServiceImplV1 implements CommentService {

	protected final CommentDao comDao;

	@Autowired
	public void create_table() {
		Map<String, String> maps = new HashMap<String, String>();
		comDao.create_table(maps);
	}
	@Override
	public List<CommentDTO> selectByMenuseq(Long menu_seq, Model model) {
		List<CommentDTO> comList = comDao.selectByMenuseq(menu_seq);
		model.addAttribute("COMMENT", comList);
		return comList;
	}
	@Override
	public int insert(CommentDTO commentDTO) {
		
		return comDao.insert(commentDTO);
	}

}
