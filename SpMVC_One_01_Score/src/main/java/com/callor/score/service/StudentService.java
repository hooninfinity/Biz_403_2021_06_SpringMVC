package com.callor.score.service;

import java.util.List;

import com.callor.score.model.StudentDTO;
import com.callor.score.model.StudentVO;

public interface StudentService {
	public List<StudentDTO> selectAll();
	public int insert(StudentVO vo);
	public int delete(StudentVO vo);
	public int update(String st_num);
}
