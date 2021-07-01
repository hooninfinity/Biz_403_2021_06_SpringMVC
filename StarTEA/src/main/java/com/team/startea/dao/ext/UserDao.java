package com.team.startea.dao.ext;

import com.team.startea.dao.GenericDao;
import com.team.startea.model.UserVO;

public interface UserDao extends GenericDao<UserVO, String> {

	public int join(UserVO usVO);

	public UserVO login(UserVO usVO);
	
	
	
	

}
