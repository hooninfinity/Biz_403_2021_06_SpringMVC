package com.callor.score.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.score.model.StudentDTO;
import com.callor.score.model.StudentVO;
import com.callor.score.persistence.StudentDao;
import com.callor.score.service.StudentService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service("studentv1")
public class StudentServiceImplV1 implements StudentService {

	protected final StudentDao stDao;
	
	@Override
	public List<StudentDTO> selectAll() {
		return stDao.selectAll();
	}
	@Override
	public int insert(StudentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int delete(StudentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int update(String st_num) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
