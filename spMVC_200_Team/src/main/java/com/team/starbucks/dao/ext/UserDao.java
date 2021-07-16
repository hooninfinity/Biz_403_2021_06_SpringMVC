package com.team.starbucks.dao.ext;

import com.team.starbucks.dao.GenericDao;
import com.team.starbucks.model.UserVO;

public interface UserDao extends GenericDao<UserVO, String> {

	public int join(UserVO usVO);

	public UserVO login(UserVO usVO);

	public void insertOrUpdate(UserVO usVO);
	
	
	
	

}