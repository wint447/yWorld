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
	public String register(MemberVO memberVo) throws Exception {
		System.out.println(memberVo);
		int result = memberDAO.register(memberVo);
		return "redirect:/";
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
	 * 개인정보 수정
	 * */
	@RequestMapping(value = "/toPrivate", method = RequestMethod.GET)
	public String toPrivate() {
		return "user/private";
	}
}
