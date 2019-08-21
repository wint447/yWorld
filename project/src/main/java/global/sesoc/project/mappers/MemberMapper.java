package global.sesoc.project.mappers;

import global.sesoc.project.vo.MemberVO;

public interface MemberMapper {
	
	// 로그인 처리
	public abstract MemberVO login(MemberVO memberVO) throws Exception;

    // 회원가입 처리
	public abstract int register(MemberVO memberVO) throws Exception;

	// 아이디중복 처리
	public abstract MemberVO idCheck(String searchID);

	// 닉네임중복 처리
	public abstract MemberVO nameCheck(String searchName);

	// 회원탈퇴 처리
	public abstract int leaveAccount(MemberVO memberVO) throws Exception;
    
    // 비밀번호 찾기
	public abstract MemberVO getUserPw(String id) throws Exception;

    // 회원정보 수정처리
	public abstract int userInfoUpdate(MemberVO memberVO) throws Exception;


}
