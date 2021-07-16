package com.team.starbucks.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.starbucks.dao.ext.UserDao;
import com.team.starbucks.model.UserVO;
import com.team.starbucks.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("userServiceV1")
public class UserServiceImplV1 implements UserService {

	protected final UserDao usDao;

	@Autowired
	public void create_user_table(UserDao dummy) {
		Map<String, String> maps = new HashMap<String, String>();
		usDao.create_table(maps);
	}

	// 리스트 조회
	@Override
	public List<UserVO> selectAll() {
		List<UserVO> usList = usDao.selectAll();
		log.debug("Service User {} ", usList.toString());
		return usDao.selectAll();
	}

	// 회원가입
	@Override
	public UserVO join(UserVO usVO) {
		List<UserVO> users = usDao.selectAll();
		log.debug("Users {}", users.toString());

		if (users == null || users.size() < 1) {
			usVO.setUser_level(0);
		} else {
			usVO.setUser_level(9);
		}
		usDao.insertOrUpdate(usVO);
		return usVO;
	}

	// 로그인
	@Override
	public UserVO login(UserVO usVO) {
		return usDao.login(usVO);
	}

	// 유효성 검사
	@Override
	public UserVO findById(String user_id) {

		UserVO userVO = usDao.findById(user_id.trim());

		if (userVO == null) {
			// 가입되지 않은 사용자 ID
			log.debug("가입되지 않은 사용자 {} ", user_id);
		} else {
			log.debug("조회된 사용자 정보 : {}", userVO.toString());
		}

		return userVO;
	}

}
