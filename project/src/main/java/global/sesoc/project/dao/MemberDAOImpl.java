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
	
	@Override
	public int leaveAccount(MemberVO memberVO) throws Exception {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = mapper.leaveAccount(memberVO);
		return result;
	}

	@Override
	public String getmemberPw(String id) throws Exception {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		String result = mapper.getUserPw(id).getPassword();
		return result;
	}

	@Override
	public int memberInfoUpdate(MemberVO memberVO) throws Exception {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);	
		int result = mapper.userInfoUpdate(memberVO);
		return result;
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
}
