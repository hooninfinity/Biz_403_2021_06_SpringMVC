package com.team.starbucks.service.impl;

import java.util.List;

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

	// 유효성 검사
	@Override
	public UserVO findById(String user_id) {
		
		UserVO userVO = usDao.findById(user_id.trim());
		
		if(userVO == null) {
			// 가입되지 않은 사용자 ID
			log.debug("가입되지 않은 사용자 {} ", user_id);
		} else {
			log.debug("조회된 사용자 정보 : {}", userVO.toString());
		}
		
		return userVO;
	}




}



