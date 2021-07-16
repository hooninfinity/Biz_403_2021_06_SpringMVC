package com.team.starbucks.dao.ext;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.starbucks.dao.GenericDao;
import com.team.starbucks.model.FileDTO;

public interface FileDao extends GenericDao<FileDTO,String>{

	public FileDTO findById(Long file_seq);
	
	public int insertOrUpdateWithList(@Param("fileList") List<FileDTO> files);

	public int insertOrUpdate(FileDTO fileDTO);


}


