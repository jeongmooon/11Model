package com.model2.mvc.web.coupon;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.coupon.CouponService;
import com.model2.mvc.service.domain.Coupon;
import com.model2.mvc.service.domain.User;

@RestController
@RequestMapping("/coupon/*")
public class CouponRestController {
	@Autowired
	@Qualifier("couponServiceImpl")
	private CouponService couponService;
	
	public CouponRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/addCoupon", method=RequestMethod.GET)
	public String addCoupon(Coupon coupon, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");	
		coupon.setUserId(user.getUserId());
		coupon.setUseCheck("0");
		
		System.out.println("Coupon 정보 : >>>>>>>>>>>>>>>"+coupon);
		
		couponService.addCoupon(coupon);
		
		List<Coupon> cL = null;
		if(user.getCoupon().size() == 0) {
			cL = new ArrayList<Coupon>();
			cL.add(coupon);
		} else {
			cL = user.getCoupon();
			cL.add(coupon);
		}		
		user.setCoupon(cL);
		
		session.setAttribute("user", user);
//		
		return "성공";
	}
}
