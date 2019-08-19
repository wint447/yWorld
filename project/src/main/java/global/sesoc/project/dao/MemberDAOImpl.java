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
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO result = mapper.login(memberVO);
		return null;
	}

	@Override
	public int register(MemberVO memberVO) throws Exception {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = mapper.register(memberVO);
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
}
