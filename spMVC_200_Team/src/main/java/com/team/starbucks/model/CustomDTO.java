package com.team.starbucks.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CustomDTO {
	private Long menu_seq;
	private String user_id;
	private Long menu_code;
	private String menu_name;
	private String menu_title;
	private String menu_option;
	
	private String file_originalName;
	private String file_upname;
	
}