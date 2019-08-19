package global.sesoc.project.dao;

import org.springframework.stereotype.Repository;

import global.sesoc.project.vo.MemberVO;

@Repository
public interface MemberDAO {
	
    // 로그인 처리
    MemberVO login(MemberVO memberVO) throws Exception;

    // 회원가입 처리
    int register(MemberVO memberVO) throws Exception;

    // 회원탈퇴 처리
    int leaveAccount(MemberVO memberVO) throws Exception;
    
    // 비밀번호 찾기
    String getmemberPw(String memberId) throws Exception;

    // 회원정보 수정처리
    int memberInfoUpdate(MemberVO memberVO) throws Exception;
}
