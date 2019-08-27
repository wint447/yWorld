package global.sesoc.project.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import global.sesoc.project.vo.MemberVO;

@Controller
@RequestMapping("page")
public class PageController {
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	
	// 기존에 존재 page
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String loadBoard() {
		return "page/page";
	}
	
	@RequestMapping(value = "/page2", method = RequestMethod.GET)
	public String loadBoard2() {
		return "page/page2";
	}

	
	@RequestMapping(value = "/page3", method = RequestMethod.GET)
	public String loadBoard3() {
		return "page/page3";
	}
	
	// 01.pageManagement로 이동
			@RequestMapping(value = "/pageManagement", method = RequestMethod.GET)
			public String pageMangement() {
				return "user/pageManagement";
			}
		
			// 02.개인정보관리로 이동 메서드
			@RequestMapping(value = "/privacyPage", method = RequestMethod.GET)
			public String toPrivate() {
				return "user/privacy";
			}
			
		// 03. 로그아웃  메서드
			@RequestMapping(value = "/logout", method = RequestMethod.GET)
			public String logout(HttpSession session) {
				session.removeAttribute("loginID");
				
				return "redirect:/";
			}
}//삭제금지