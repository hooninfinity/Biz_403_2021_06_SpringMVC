package com.team.starbucks.model;

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
public class CustomVO {
	private String menu_seq;
	private String user_id;
	private String menu_code;
	private String menu_title;
	private String menu_option;
	private String menu_img;
}
