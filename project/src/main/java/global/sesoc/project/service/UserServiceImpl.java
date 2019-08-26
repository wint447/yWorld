package global.sesoc.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


import global.sesoc.project.dao.MemberDAOImpl;
import global.sesoc.project.vo.MemberVO;




@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	MemberDAOImpl dao;
	
	@Override
	public void create(MemberVO uVO) throws Exception {
		// TODO Auto-generated method stub
		
		dao.register(uVO);
		
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(50, false);

		uVO.setAuthCode(authkey);
		dao.updateAuthkey(uVO);

		// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[YELLOW WORLD] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<img src=\"http://localhost:8888/project/resources/image/ywlogo.png\"><br>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8888/project/user/joinConfirm?id=")
				.append(uVO.getId())
				.append("&authCode=")
				.append(authkey)
				.append("&nickName=")
				.append(uVO.getNickName())
				.append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("wint44777@gmail.com", "㈜옐로우월드");
		sendMail.setTo(uVO.getId());
		sendMail.send();
	}
	
	@Override
	public void updateAuthstatus(MemberVO uVO) throws Exception{
		dao.updateAuthstatus(uVO);
		
		
	}


}
