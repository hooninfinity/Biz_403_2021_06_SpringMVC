package com.team.startea.dao.ext;

import com.team.startea.dao.GenericDao;
import com.team.startea.model.UserVO;

public interface UserDao extends GenericDao<UserVO, String> {

//	public String join(
//			@Param("user_id") String user_id,
//			@Param("user_password") String user_password,
//			@Param("user_email") String user_email
//			);

	public int join(UserVO usVO);

}
