package com.model2.mvc.web.starNum;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model2.mvc.service.domain.StarNum;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.starNum.StarNumService;

@Controller
@RequestMapping("/starNum/*")
public class StarNumController {
	@Autowired
	@Qualifier("starNumServiceImpl")
	private StarNumService starNumService;
	
	public StarNumController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	//@RequestMapping("/addStarNum.do")
	@RequestMapping(value="addStarNum", method=RequestMethod.POST)
	public String addStarNum(HttpSession session, @ModelAttribute("starNum") StarNum starNum) throws Exception {
		System.out.println("/addStarNum.do");
		
		starNum.setUserId(((User)(session.getAttribute("user"))).getUserId());
		starNum.setCheckB("1");
		
		starNumService.addStarNum(starNum);
		
		return "redirect:/starSuccess.jsp";
	}
}
