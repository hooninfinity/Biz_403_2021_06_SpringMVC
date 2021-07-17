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
public class CommentDTO {
	private Long comment_seq = 0L;
	private String comment;
	private String user_id;
	private Long menu_seq;
	private String date;
}
