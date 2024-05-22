package com.kupid.inquiry.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Inquiry {
	private String inqTitle;
	private String inqContent;
	private String inqFile;
}
