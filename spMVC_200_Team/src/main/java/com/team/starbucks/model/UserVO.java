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
public class UserVO {
	private Long user_seq;
	private String user_id;
	private String user_password;
	private String user_email;
	private int user_level;
}