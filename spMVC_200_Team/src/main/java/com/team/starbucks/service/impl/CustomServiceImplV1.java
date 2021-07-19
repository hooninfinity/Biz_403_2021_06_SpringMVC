package com.team.starbucks.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.team.starbucks.dao.ext.CategoryDao;
import com.team.starbucks.dao.ext.CustomDao;
import com.team.starbucks.model.CategoryDTO;
import com.team.starbucks.model.CustomDTO;
import com.team.starbucks.service.CustomService;
import com.team.starbucks.service.FileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("customServiceV1")
public class CustomServiceImplV1 implements CustomService {

	protected final CategoryDao cateDao;
	protected final CustomDao cusDao;

	@Qualifier("fileServiceV1")
	protected final FileService fService;

	@Autowired
	public void create_table() {
		Map<String, String> maps = new HashMap<String, String>();
		cusDao.create_table(maps);
	}

	@Override
	public List<CustomDTO> selectAll() {
		return cusDao.selectAll();
	}

	@Override
	public CustomDTO findBySeq(Long menu_seq) {
		CustomDTO customDTO = cusDao.findBySeq(menu_seq);

		return customDTO;
	}

	@Override
	public List<CustomDTO> findByUser_id(String user_id) {
		List<CustomDTO> myList = cusDao.findByUser_id(user_id);
		return myList;
	}

	@Override
	public List<CategoryDTO> findByMenukinds(Long menu_kinds) {
		// TODO Auto-generated method stub
		List<CategoryDTO> bsList = cateDao.findByMenukinds(menu_kinds);
		log.debug("bsList {} ", bsList.toString());
		return bsList;
	}

	@Override
	public List<CategoryDTO> findBybase1() {
		return cateDao.findBybase1();
	}

	@Override
	public List<CategoryDTO> findBymenuCode(Long menu_code) {
		return cateDao.findBycode(menu_code);
	}

	@Override
	public CategoryDTO findByMenuName(Long menu_code) {
		// TODO Auto-generated method stub
		return cateDao.findById(menu_code);
	}

	public String findByCodeName(Long menu_code) {

		String menu_name = cateDao.findByCodeName(menu_code);

		return menu_name;
	}

	@Override
	public void input(CustomDTO cuDTO, MultipartFile one_file) throws Exception {
		// TODO Auto-generated method stub
		String strUUID = fService.fileUp(one_file);

		log.debug("strUUID {}", strUUID);

		cuDTO.setFile_originalName(one_file.getOriginalFilename());
		cuDTO.setFile_upname(strUUID);
		log.debug("저장파일정보 {}", cuDTO.toString());
		cusDao.insert(cuDTO);
	}

	@Override
	public CustomDTO findBySearch(String search_text, String search_column, Model model) {
		// TODO Auto-generated method stub

		List<CustomDTO> searchList = cusDao.findBySearch(search_column, search_text);

		model.addAttribute("searchList", searchList);

		return null;
	}

	@Override
	public void delete(Long seq, Model model) throws Exception {
			CustomDTO customDTO = cusDao.findBySeq(seq);
		int ret = fService.delete(customDTO.getFile_upname());
		if(ret > 0) {
			log.debug("파일삭제완료");
			cusDao.delete(seq);
		} else if(ret < 0 ) {
			log.debug("파일삭제실패 잘못된 파일정보 {} ", customDTO.toString());
		
		}
	}

	@Override
	public void update(Long seq) {
		// TODO Auto-generated method stub

	}

}