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
public class BoardDTO {
	private String board_seq;
	private String board_writer;
	private String user_id;
	private String file_seq;
	private String board_title;//
	private String board_content;//
	private String board_like;//
	private String board_date;//
	private String board_time;//
}
