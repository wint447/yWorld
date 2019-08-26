package global.sesoc.project.service;

import global.sesoc.project.vo.MemberVO;

public interface UserService {

	public void create(MemberVO uVO) throws Exception;
	
	public void updateAuthstatus(MemberVO uVO) throws Exception;
}
