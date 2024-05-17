package com.kupid.member.model.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString

public class MemberDto {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String gender;
	private String phone;
	private String address;
	private String addressDetail;
	private String email;
	private Date birth;
	private String nickname;
	private String introduce;
	private String profileImgOriname;
	private String profileImgRenamed; //재정의 이름 일단 만들어둠(수업에서 배운 내용 활용)
	private String memberGrade;
	private Date enrollDate; //sql date 사용
}