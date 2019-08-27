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

	// private - nickName 중복 검사
	public MemberVO privateNickName(String nickName);

	// private - 현재 비밀번호 확인
	public MemberVO privacyPassword(MemberVO member);

	// private - 개인정보 수정 처리
	public abstract int privacyCommit(MemberVO member);
	
	//이메일 인증
	public int updateAuthkey(MemberVO uVO) throws Exception;
	//이메일 인증 확인
	public void updateAuthstatus(MemberVO uVO) throws Exception;
	//이메일 인증 상태 가져오기
	public int gStatus(MemberVO uVO) throws Exception;
		

}//삭제금지