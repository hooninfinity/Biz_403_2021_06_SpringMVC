package com.callor.jdbc.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.jdbc.model.CompVO;
import com.callor.jdbc.persistance.CompDao;
import com.callor.jdbc.service.CompService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("compServiceV1")
public class CompServiceImplV1 implements CompService {
	
	protected final CompDao compDao;
	public CompServiceImplV1(CompDao compDao) {
		this.compDao = compDao;
	}

	@Override
	public int insert(CompVO vo) {
		// TODO Auto-generated method stub
		String cpCode = compDao.findByMaxCode();
		log.debug("Cpcode {} ", cpCode);
		
		if(cpCode == null || cpCode.equals("")) {
			
			// 출판사코드를 자동으로 만드는 기능
			// C로 시작하고 이후 4개 자리를 만들어서 1을 표시하는데, 비어있는 곳에 0을 채워라
			// C00001
			cpCode = String.format("C%04d", 1);
		} else {
			// 영문 접두사 C를 자르고 숫자만 추출
			String _code = cpCode.substring(1);
			Integer intCode = Integer.valueOf(_code) + 1;
			cpCode = String.format("C%04d", intCode);
		}
		vo.setCp_code(cpCode);
		compDao.insert(vo);
		
		return 0;
	}

	@Override
	public List<CompVO> findByCname(String cp_name) {
		// 전달받은 출판사 이름에서 앞뒤의 빈칸을 제거하고
		// Dao에게 Toss 한 후
		// 출판사 리스트를 받아 다시 return
		return compDao.findByCname(cp_name.trim());
	}

	@Override
	public List<CompVO> selectAll() {
		return compDao.selectAll();
	}

	@Override
	public CompVO findByCCode(String cp_code) {
		return compDao.findById(cp_code.trim());
	}

}






