package com.kupid.feed.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Feed {
	private int feedNo;
	private String feedMemberName;
	private String feedWriterName;
	private int feedViewCount;
	private Date feedWriteDate;
	private Date feedUpdateDate;
	private String	feedContent;
	private String filePath;
	private int likes;
	private int report;
}
