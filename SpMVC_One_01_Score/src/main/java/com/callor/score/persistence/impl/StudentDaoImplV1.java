package com.callor.score.persistence.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.score.model.StudentDTO;
import com.callor.score.model.StudentVO;
import com.callor.score.persistence.StudentDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("stDaoV1")
public class StudentDaoImplV1 implements StudentDao {

	protected final JdbcTemplate jdbcTemplate;

	public StudentDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<StudentDTO> selectAll() {
		// TODO 여기는 학생정보 전체 조회
		String sql = " SELECT * FROM view_성적정보 ";

		List<StudentDTO> stList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<StudentDTO>(StudentDTO.class));

		log.debug("Student Select {} ", stList.toString());
		return stList;
	}

	@Override
	public StudentVO findById(String pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(StudentVO vo) {
		// TODO 여기는 학생정보 작성
		String sql = " INSERT INTO tbl_student ";
		sql += " (st_num, st_name, st_dept, st_grade, st_tel, st_addr) ";
		sql += " VALUES( ?,?,?,?,?,? ) ";

		Object[] params = new Object[] { vo.getSt_num(), vo.getSt_name(), vo.getSt_dept(), vo.getSt_grade(),
				vo.getSt_tel(), vo.getSt_addr() };

		return jdbcTemplate.update(sql, params);
	}

	@Override
	public int update(StudentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String pk) {
		// TODO Auto-generated method stub
		return 0;
	}
}
