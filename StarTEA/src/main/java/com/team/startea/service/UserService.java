package com.team.startea.service;

import java.util.List;

import com.team.startea.model.UserVO;

public interface UserService {
	
	public UserVO login(String user_id, String user_password);
	
	public List<UserVO> selectAll();
	public int join(UserVO usVO);

}
