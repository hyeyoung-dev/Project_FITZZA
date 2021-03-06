package com.team.fitzza.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.MemberVO;

@Mapper
@Repository
public interface MemberDAO {
	
	// 회원등록 
	public int memberInsert(MemberVO vo);
	// 강제탈퇴 회원 확인
	public int Isforced(String email);
	// 로그인
	public MemberVO loginCheck(MemberVO vo);
	// 회원정보수정 폼
	public MemberVO memberSelect(String user_id);
	// 회원정보수정 DB
	public int memberUpdate(MemberVO vo);
	// 아이디중복검사
	public int idCheck(String user_id);
	// 닉네임중복검사
	public int nickCheck(String user_nickname);
	// pwdCheck 폼
	public MemberVO pwdCheck(MemberVO vo);
	// 회원 탈퇴
	public int memberBye(MemberVO vo);
	// 자진 탈퇴
	public int selfBye(MemberVO vo);
	//마이페이지
	public MemberVO myPage(String user_id);
	//프로필 사진 바꾸기
	public MemberVO getFileName(String user_id);
	public int changeProfileImg(MemberVO vo);


	public int expUp_board(String user_id);
	public int expUp_reply(String user_id);
	public int expDown_board(String user_id);
	public int expDown_reply(String user_id);
}
