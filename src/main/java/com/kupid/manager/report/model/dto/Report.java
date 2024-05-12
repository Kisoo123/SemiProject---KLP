package com.kupid.manager.report.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Report {
	private int reportNo;
	private String reportCategory;
	private String reportContent;
	private Date reportDate;
	private int reportPeople;
	private int reportLevel;
}
