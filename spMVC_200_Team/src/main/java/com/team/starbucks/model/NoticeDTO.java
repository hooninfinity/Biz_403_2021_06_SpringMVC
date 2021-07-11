package com.team.starbucks.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class NoticeDTO {

	private Long nt_code;
	private String nt_title;
	private String nt_content;
	private String nt_date;
	private String nt_time;
	private String nt_img;
}