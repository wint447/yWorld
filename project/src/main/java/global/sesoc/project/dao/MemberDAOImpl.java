package global.sesoc.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project.mappers.MemberMapper;
import global.sesoc.project.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;
	
	//로그인
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO result = mapper.login(memberVO);
		return result;
	}

	//회원가입
	@Override
	public int register(MemberVO memberVO) throws Exception {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		System.out.println(memberVO);
		int result = mapper.register(memberVO);
		return result;
	}

	//아이디 중복확인
	@Override
	public MemberVO idCheck(String searchID) throws Exception {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO result = mapper.idCheck(searchID);
		return result;
	}
	
	//닉네임 중복확인
	@Override
	public MemberVO nameCheck(String searchName) throws Exception {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO result = mapper.nameCheck(searchName);
		return result;
	}
	
	//private - 닉네임 중복검사 
			@Override
			public MemberVO privateNickNameCk(String nickName) throws Exception {
				MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
				
				MemberVO res = mapper.privateNickName(nickName);
				
				return res;
			}
		
		//private - 현재 비밀번호 확인
			@Override
			public MemberVO privacyPassword(MemberVO member) {
				MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
				
				MemberVO res = mapper.privacyPassword(member);
				
				return res;
			}

		//private - 개인정보 수정 처리
			@Override
			public int privacyCommit(MemberVO member) {
				MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
				
				int res = mapper.privacyCommit(member);
				
				return res;
			}

	
	
	//이메일 인증 DAO
	@Override
	public int updateAuthkey(MemberVO uVO) throws Exception{
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = mapper.updateAuthkey(uVO);
		
		return result;
	}
	
	@Override
	public void updateAuthstatus(MemberVO uVO) throws Exception{
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.updateAuthstatus(uVO);
		
	}
	
	@Override
	public int gStatus(MemberVO uVO) throws Exception{
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = mapper.gStatus(uVO);
		
		return result;
	}
}//삭제금지