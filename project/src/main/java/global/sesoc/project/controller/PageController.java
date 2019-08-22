package global.sesoc.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("page")
public class PageController {
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String loadBoard() {
		return "page/page";
	}
	
	@RequestMapping(value = "/pageManagement", method = RequestMethod.GET)
	public String pageMangement() {
		return "pageManagement";
	}
		
	@RequestMapping(value = "/editpage", method = RequestMethod.GET)
	public String editPage() {
		logger.debug("이동....");
		return "include/page/editpage";
	}
}
