package com.team.startea.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team.startea.dao.ext.UserDao;
import com.team.startea.model.UserVO;
import com.team.startea.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("userServiceV1")
public class UserServiceImplV1 implements UserService {
	
	protected final UserDao usDao;

	// 리스트 조회
	@Override
	public List<UserVO> selectAll() {
		List<UserVO> usList = usDao.selectAll();
		log.debug("Service User {} ", usList.toString());
		return usDao.selectAll() ;
	}

	// 회원가입
	@Override
	public int join(UserVO usVO) {
		return usDao.join(usVO);
	}

	// 로그인
	@Override
	public UserVO login(UserVO usVO) {
		return usDao.login(usVO);
	}




}



