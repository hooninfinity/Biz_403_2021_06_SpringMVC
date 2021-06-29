package com.team.startea.service;

import java.util.List;

import com.team.startea.model.UserVO;

public interface UserService {
	
	public List<UserVO> selectAll();
	public String join(UserVO usVO);

}
