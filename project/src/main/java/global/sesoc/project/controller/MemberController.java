package global.sesoc.project.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import global.sesoc.project.dao.MemberDAO;
import global.sesoc.project.service.UserServiceImpl;
import global.sesoc.project.vo.MemberVO;




@Controller
@RequestMapping("user")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberDAO memberDAO;

	
	@Autowired
	UserServiceImpl userService;
	
	/**
	 * 회원가입 Form의 내용을 받아, 회원가입 처리의 역할을 수행한다.
	 * @param memberVO
	 * */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(MemberVO memberVo) throws Exception {
		System.out.println(memberVo);
		/*
		int result = memberDAO.register(memberVo);*/
		
		userService.create(memberVo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="joinConfirm", method=RequestMethod.GET)
	public String emailConfirm(MemberVO uVO, Model model) throws Exception {
			// authstatus를 1로,, 권한 업데이트2
		userService.updateAuthstatus(uVO);
		MemberVO result = memberDAO.idCheck(uVO.getId());
		
		
		model.addAttribute("auth_check", 1);
		model.addAttribute("user", result);
		return "joinPost";
	}
	
	/**
	 * 아이디 중복 확인
	 * */
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(String searchID) throws Exception {
		System.out.println(searchID);
		MemberVO result = memberDAO.idCheck(searchID);
		
		if(result != null){
			return "false";
		}
		else return "true";
	}
	
	/**
	 * 닉네임 중복 확인
	 * */
	@ResponseBody
	@RequestMapping(value = "/nameCheck", method = RequestMethod.POST)
	public String nameCheck(String searchName) throws Exception {
		System.out.println(searchName);
		MemberVO result = memberDAO.nameCheck(searchName);
		
		if(result != null){
			return "false";
		}
		else return "true";
	}
	
	
	/**
	 * 로그인 처리
	 * @param session, memberVO
	 * 
	 * */
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpSession session, MemberVO memberVO) throws Exception {
		System.out.println(memberVO);
		MemberVO result = memberDAO.login(memberVO);
		if (result != null) {
			session.setAttribute("loginID",result);
		} 
		else {
			return "user/auto_loginPost";
		}
		return "redirect:/page/pageManagement";
	}
	/**
	* PageController 내용 - 현선
	*
	* 01.- 개인정보관리내용
	* -----------------------------------------------------------------------------
	*/
		
		
	// 01.개인정보관리 - 닉네임 중복검사 (ajax사용)
	@ResponseBody
	@RequestMapping(value = "/privacyNickNameCk", method = RequestMethod.POST)
	public String privacy_nickNameCk(String nickName) throws Exception {
		MemberVO res = memberDAO.privateNickNameCk(nickName);
		
		if(res != null){
			return "false";
		}
		
		else return "true";
	}
	
	@ResponseBody
	@RequestMapping(value = "/privacyPassword", method = RequestMethod.POST)
	public String privacyPassword(MemberVO member) throws Exception {
		MemberVO res = memberDAO.privacyPassword(member);
		if(res != null){
			System.out.println(res);
			return "true";
		}		
		else return "false";
	}
	
	@RequestMapping(value = "/privacyCommit", method = RequestMethod.POST)
	public String privacyCommit(MemberVO member, HttpSession session, Model model) throws Exception {
		int res = memberDAO.privacyCommit(member);

		if(res == 1){
			session.removeAttribute("loginID"); // 있던 세션 삭제
			MemberVO res2 = memberDAO.idCheck(member.getId()); 
			session.setAttribute("loginID",res2); //세션 다시 설정하기
			return "redirect:/page/pageManagement";
		}
		
		else {

			return "redirect:/page/privacyPage";
		}
	}
	
}//삭제금지