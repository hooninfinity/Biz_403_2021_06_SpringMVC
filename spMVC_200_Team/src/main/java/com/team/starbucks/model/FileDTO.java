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
public class FileDTO {
	private Long g_seq;//	BIGINT
	private String g_writer;//	VARCHAR(20)
	private String g_date;//	VARCHAR(10)
	private String g_time;//	VARCHAR(10)
	private String g_subject;//	VARCHAR(50)
	private String g_content;//	VARCHAR(1000)
	private String g_image;//	VARCHAR(125)
}