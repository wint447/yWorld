package global.sesoc.project.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.project.dao.MemberDAO;
import global.sesoc.project.vo.MemberVO;

@Controller
@RequestMapping("user")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberDAO memberDAO;
	
	/**
	 * 회원가입 Form의 내용을 받아, 회원가입 처리의 역할을 수행한다.
	 * @param memberVO
	 * */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(MemberVO memberVO) {
		return "redirect:/";
	}
	
	/**
	 * 로그인 처리
	 * @param session, memberVO
	 * */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpSession session, MemberVO memberVO) {
		return "redirect:/";
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
