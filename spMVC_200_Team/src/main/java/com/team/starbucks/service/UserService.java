package com.team.starbucks.service;

import java.util.List;

import com.team.starbucks.model.UserVO;

public interface UserService {
	// 리스트 조회
	public List<UserVO> selectAll();
	
	// 회원가입
	public UserVO join(UserVO usVO);
	
	// 로그인
	public UserVO login(UserVO usVO);
	
	// 유효성 검사
	public UserVO findById(String user_id);
	
	
	//회원 정보 수정
	public void insertOrUpdate(UserVO userVO) throws Exception;
	
	public void update(UserVO userVO) throws Exception;

	public void delete(Long user_seq);
}