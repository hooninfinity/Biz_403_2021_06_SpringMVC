package com.callor.score.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class StudentDTO {
	private long st_num;
	private String st_name;
	private String st_dept;
	private String st_grade;
	private String sum;
	private String count;
	private String avg;
}
