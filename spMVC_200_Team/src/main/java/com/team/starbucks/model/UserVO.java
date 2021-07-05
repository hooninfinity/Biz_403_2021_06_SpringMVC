package com.team.starbucks.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	
	private String user_id;	//	VARCHAR(20)
	private String user_password;	//	VARCHAR(50)
	private String user_email;	//	VARCHAR(50)


}
