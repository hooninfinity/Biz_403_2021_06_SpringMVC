package com.callor.score.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.score.model.StudentVO;

public interface StudentService {
	
	public List<StudentVO> selectAll();
	
	public Integer insert(StudentVO studentVO);

}
