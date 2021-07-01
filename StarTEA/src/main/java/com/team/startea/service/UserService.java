package com.team.startea.service;

import java.util.List;

import com.team.startea.model.UserVO;

public interface UserService {
	
	public List<UserVO> selectAll();
	
	// 회원가입
	public int join(UserVO usVO);
	
	// 로그인
	public UserVO login(UserVO usVO);

}
