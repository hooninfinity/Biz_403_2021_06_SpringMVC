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
	private Long menu_seq;
	private String user_id;
	private int menu_code;
	private String menu_title;
	private String menu_option;
	private String menu_img;
}