package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Coupon;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Stock;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	public PurchaseController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	//@RequestMapping("/addPurchaseView.do")
	@RequestMapping(value="addPurchase", method=RequestMethod.GET)	
	public String addPurchaseView(@RequestParam("prodNo") int prodNo ,HttpSession session, Model model) throws Exception {
		Product product =purchaseService.addPurchasView(prodNo);
		model.addAttribute("product",product);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	//@RequestMapping("/addPurchase.do")
	@RequestMapping(value="addPurchase",method=RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase, @ModelAttribute("coupon") Coupon coupon,
							 @ModelAttribute("stock") Stock stock ,HttpSession session, @ModelAttribute("product")Product product) throws Exception{
		purchase.setBuyer((User)(session.getAttribute("user")));
		purchase.setPurchaseProd(product);
		purchase.setTranCode("1");
		coupon.setUseCheck("1");
		stock.setStatus(1);
		System.out.println(">>>>>>>>>>>>"+purchase);
		System.out.println(">>>>>>>>>>>>"+coupon);
		purchaseService.addPurchase(purchase,coupon,stock);
		
		return "redirect:/purchase/listPurchase.do";
	}
	
	//@RequestMapping("/getPurchase.do")
	@RequestMapping(value="getPurcahse", method=RequestMethod.GET)
	public String getPruchase(@RequestParam("tranNo") int tranNo,Model model) throws Exception{
		Purchase purchase = purchaseService.getPurcahse(tranNo);
		model.addAttribute("purchase",purchase);
		
		return "forward:/purchase/getPurchase.jsp";
	}
	
	//@RequestMapping("/updatePurchaseView.do")
	@RequestMapping(value="updatePurchase", method=RequestMethod.GET)
	public String updatePurchaseView(@RequestParam("tranNo") int tranNo,Model model) throws Exception{
		Purchase purchase = purchaseService.getPurcahse(tranNo);
		model.addAttribute("purchase",purchase);
		
		return "forward:/purchase/updatePurchase.jsp";
	}
	
	//@RequestMapping("/updatePurchase.do")
	@RequestMapping(value="updatePurchase", method=RequestMethod.POST)
	public String updatePurchase(@ModelAttribute("purchase") Purchase purchase) throws Exception{
		purchaseService.updatePurchase(purchase);
		
		return "redirect:/purchase/listPurchase.do";
	}
	
	//@RequestMapping("/updateTranCode.do")
	@RequestMapping(value="updateTranCode")
	public String updateTranCode(@ModelAttribute("purchase") Purchase purchase, @RequestParam("con") String con) throws Exception{
		purchaseService.updateTranCode(purchase);
		
		if(con.equals("user")) {
			return "redirect:/purchase/listPurchase";
		}
		
		return "redirect:/purchase/listSale?searchValue=0";
	}
	
	//@RequestMapping("/listPurchase.do")
	@RequestMapping(value="listPurchase")
	public String listPurchase(@ModelAttribute("search") Search search, HttpSession session,Model model) throws Exception {
		System.out.println("/listPurchase");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);	
		
		Map<String, Object> map = purchaseService.getPurchaseList(search,((User)(session.getAttribute("user"))).getUserId());
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/purchase/listPurchase.jsp";
	}
	
	//@RequestMapping("/listSale.do")
	@RequestMapping(value="listSale")
	public String listSale(@ModelAttribute("search") Search search,Model model) throws Exception {
		System.out.println("/listSale.do");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> map = purchaseService.getSaleList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/purchase/listSale.jsp";
	}
	
	@GetMapping("/score")
	public String score(HttpServletRequest request) {
		return "forward:/score.html?prodNo="+request.getParameter("prodNo")+"&tranNo="+request.getParameter("tranNo");
	}
}
