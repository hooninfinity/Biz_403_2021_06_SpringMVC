package com.callor.gallery.service.impl;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("fileServiceV2")
public class FileServiceImplV2 extends FileServiceImplV1 {
	
	// file-context.xml에 설정된 변수값 가져오기
	protected final String winPath;
	protected final String macPath;
	
	protected String fileUpPath;
	
	@Autowired
	public void getFilePath(String winPath, String macPath) {
		/*
		 * 파일을 업로드 할때 사용할 path 가져오기
		 * 
		 * 1. 지정된 폴더를 윈도우 기반의 폴더로 설정
		 * 2. mac 기반의 폴더가 있으면 해당 폴더로 변경
		 */
		this.fileUpPath = this.winPath;
	}
	
	@Override
	public String fileUp(MultipartFile file) throws Exception {
		
		// 기본파일을 선택하지 않으면 noImage 뜨도록 
		String originFileName = file.getOriginalFilename();
		if(originFileName == null || originFileName.isEmpty()) {
			return "";
		}
		
		// 현재 시스템에 macPath로 설정된 폴더가 있는지 확인하고
		// 있으면 업로드 폴더를 macPath에서 지정된 값으로 설정하기
		File path = new File(macPath);
		if(path.exists()) {
			this.fileUpPath = this.macPath;
		}
		
		// 다시한번 filePath 가 있는지 검사
		// winPath일 경우는 폴더를 만들어라
		path = new File(fileUpPath);
		if(!path.exists()) {
			path.mkdirs();
		}

		/*
		 * 파일을 업로드 할 때 보안 주의하기
		 * 실제 파일이름으로 업로드를 수행하면 쉽게 업로드 구현이 된다.
		 * 
		 * 하지만
		 * 만약 같은 이름의 파일을 중복해서 업로드하면
		 * 먼저 업로드 된 파일이 변경되는 문제가 발생한다.
		 * 
		 * 해커에 의해서 같은 이름으로 파일들을 업로드 해 버리면
		 * 저장된 원래 파일들이 모드 변조될 수 있다.
		 * 
		 * 이러한 문제를 방지하기 위하여
		 * UUID 문자열을 생성하고
		 * UDID + 원래파일이름.원래확장자 형식으로 업로드를 수행한다.
		 * 이런 방식으로 파일을 저장하면 해킹의 위험을 다소 막을 수 있다.
		 */
		String strUUID = UUID.randomUUID().toString();
		strUUID += originFileName;
		
		// 실제 파일 업로드할 path와 파일이름을 + 하여
		// 업로드 준비
		// /files + "/" + originalFileName
		File uploadPathAndFile = new File(fileUpPath, strUUID);
		
		// file 에 담긴 파일정보를 사용하여
		// uploadPathAndFile 에 전송하라(복사, 업로드)
		file.transferTo(uploadPathAndFile);
		return strUUID;
	}
	
	
	// 전달받은 파일이름으로 된 파일을
	// fileUpPath에서 파일 삭제
	@Override
	public int delete(String imgFileName) {
		
		/*
		 * fileService.delete(파일명)을 호출할때
		 * 파일명이 null이거나 없으면 진행을 멈추는 코드
		 * 
		 * 이러한 코드는 호출하는 곳에서
		 * 
		 * if(파일명 == null || 파일명.isEmpty()) {
		 * 		fileService.delete(파일명)
		 * }
		 * 
		 * 처럼 호출할 수 있지만
		 * delete() method 사용하는 곳이 여러 곳이라면 그때마다 검사하는 코드를 부착해야 한다.
		 * 
		 * 그것보다는 delete() method가 시작될 때
		 * 파일의 null 값 등을 검사하여 실행을 취소하는 방법이 더 편리한 코드가 될 것이다.
		 */
		// 일괄적으로 검사를 해서 파일이 없으면 통과하도록
		if(imgFileName == null || imgFileName.isEmpty()) {
			return 1;
		}
		
		// 삭제하기 위한 파일 정보 객체 생성
		File delFile = new File(this.fileUpPath, imgFileName);
		
		if(delFile.exists()) {
			
			boolean ok = delFile.delete();
			if(ok) {
				log.debug("파일 삭제 성공");
				return 1;
			} else {
				log.debug("파일 삭제 실패");
				/*
				 * method return type을 wrapper class(Integer, Long)등으로 설정하면
				 * 실패하는 메시지를 return할때 null을 return하면 된다.
				 * 
				 * primitive 숫자형으로 return type을 설정한 경우
				 * null값을 return 할 수 없다.
				 * 
				 * 이럴때 성공한 메시지는 양의 정수값을 return하고,
				 * 실패한 메시지는 음의 정수값을 return 한다.
				 * 
				 * 호출한 곳에서 성공, 실패를 검사할때
				 * 
				 * if( ret > 0 ) 성공
				 * if( ret < 0 ) 실패 와 같은 방식을 사용할 수 있다.
				 */
				return -1;
			}
		}
		// 첨부파일이 없더라도 성공한 것처럼(파일이 없어도 삭제하기 위해)
		return 1;
	}
	
	
	
	
	

}
