package global.sesoc.project.dao;

import org.springframework.stereotype.Repository;

import global.sesoc.project.vo.MemberVO;

@Repository
public interface MemberDAO {
	
    // 로그인 처리
    MemberVO login(MemberVO memberVO) throws Exception;

    // 회원가입 처리
    int register(MemberVO memberVO) throws Exception;
    
    // 회원가입_아이디_중복 처리
    MemberVO idCheck(String searchID) throws Exception;

    // 회원가입_닉네임_중복 처리
    MemberVO nameCheck(String searchName) throws Exception;
    
    // 회원탈퇴 처리
    int leaveAccount(MemberVO memberVO) throws Exception;
    
    // 비밀번호 찾기
    String getmemberPw(String memberId) throws Exception;

    // 회원정보 수정처리
    int memberInfoUpdate(MemberVO memberVO) throws Exception;
    
    
    //이메일 인증
    int updateAuthkey(MemberVO uVO) throws Exception;
    
    //이메일 인증 확인
    void updateAuthstatus(MemberVO uVO) throws Exception;
    
    //인증 상태 불러오기
    int gStatus(MemberVO uVO) throws Exception;

	

}
