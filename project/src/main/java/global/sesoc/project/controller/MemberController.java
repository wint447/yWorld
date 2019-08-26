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
		return "redirect:/pageManagement";
	}

	/**
	 * 회원정보 수정
	 * */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String memberInfoUpdate(HttpSession session, MemberVO memberVO) {
		return "redirect:/";
	}
	/**
	 * 회원탈퇴 처리
	 * */
	@RequestMapping(value = "/leaveaccount", method = RequestMethod.POST)
	public String leaveAccount(MemberVO memberVO) {
		return "redirect:/";
	}
	/**
	 * 비밀번호 찾기
	 * */
	@RequestMapping(value = "/getpassword", method = RequestMethod.POST)
	public String getmemberPw(HttpSession session, MemberVO memberVO) {
		return "redirect:/";
	}
}
