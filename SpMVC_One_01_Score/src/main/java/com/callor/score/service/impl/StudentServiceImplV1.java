package com.callor.score.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.score.model.StudentVO;
import com.callor.score.persistence.StudentDao;
import com.callor.score.service.StudentService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service("studentServiceV1")
public class StudentServiceImplV1 implements StudentService {
	
	protected final StudentDao studentDao;

	@Override
	public List<StudentVO> selectAll() {
		return studentDao.selectAll();
	}

	@Override
	public Integer insert(StudentVO studentVO) {
		return studentDao.insert(studentVO);
	}

}
