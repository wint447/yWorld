package global.sesoc.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {
	
	
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String loadBoard() {
		return "page/page";
	}
	
	@RequestMapping(value = "/pageManagement", method = RequestMethod.GET)
	public String pageMangement() {
		return "user/pageManagement";
	}
		
	@RequestMapping(value = "/toPrivate", method = RequestMethod.GET)
	public String toPrivate() {
		return "user/private";
	}
}
