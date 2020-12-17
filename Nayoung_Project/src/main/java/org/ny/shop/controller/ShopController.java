package org.ny.shop.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.ny.member.model.vo.Member;
import org.ny.shop.model.service.ShopService;
import org.ny.shop.model.vo.Cart;
import org.ny.shop.model.vo.CartList;
import org.ny.shop.model.vo.Goods;
import org.ny.shop.model.vo.OrderList;
import org.ny.shop.model.vo.Orders;
import org.ny.shop.model.vo.OrdersDetail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	@Autowired
	@Qualifier("shopService")
	ShopService shopService;

	private static final Logger Logger = LoggerFactory.getLogger(ShopController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getShopList(@RequestParam("gdsCate") String gdsCate, Model model) throws Exception {
		Logger.info("get shop list");

		List<Goods> gList = shopService.shopList(gdsCate);
		model.addAttribute("gList", gList);
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getShopView(int gdsCode, Model model) throws Exception {
		Logger.info("get shop view");

		Goods view = shopService.view(gdsCode);
		model.addAttribute("view", view);

	}

	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(Cart cart, HttpSession session) throws Exception {
		int result = 0;

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			cart.setUserId(member.getUserId());
			shopService.addCart(cart);
			result = 1;
		}
		return result;
	}

	// 카트 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
		Logger.info("get cart list");

		Member member = (Member) session.getAttribute("member");
		String userId = member.getUserId();

		List<CartList> cartList = shopService.cartList(userId);

		model.addAttribute("cartList", cartList);
	}

	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, Cart cart)
			throws Exception {
		Logger.info("delete cart");

		Member member = (Member) session.getAttribute("member");
		String userId = member.getUserId();

		// 변수 result를 이용하여 0 또는 1의 결과를 반납
		// 로그인이 안되어있거나 세션이 만료되어 자동로그아웃 된 경우 작동하지 않게 하기 위함

		// 물론 이 코드가 없더라도 카트가 삭제되지 않고 에이젝스의 error를 이용해 구분할 수 있지만,
		// 컨트롤러보다 더 깊은 Service와 DAO를 거쳐 쿼리문이 실행되는걸 막을 수 있습니다.
		int result = 0;
		int cCode = 0;

		if (member != null) {
			cart.setUserId(userId);

			for (String i : chArr) {
				cCode = Integer.parseInt(i);
				cart.setcCode(cCode);
				shopService.deleteCart(cart);
			}
			result = 1;
		}
		return result;
	}

	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, Orders order, OrdersDetail orderDetail) throws Exception {
		Logger.info("order");

		Member member = (Member) session.getAttribute("member");
		String userId = member.getUserId();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String oCode = ymd + "_" + subNum;

		order.setoCode(oCode);
		order.setUserId(userId);

		shopService.orderInfo(order);

		orderDetail.setoCode(oCode);
		shopService.orderInfo_Details(orderDetail);

		shopService.cartAllDelete(userId);

		return "redirect:/shop/orderList";
	}

	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, Orders order, Model model) throws Exception {
		Logger.info("get order list");

		Member member = (Member) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);

		List<Orders> orderList = shopService.orderList(order);

		model.addAttribute("orderList", orderList);
	}

	// 주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("oCode") String oCode, Orders order, Model model)
			throws Exception {
		Logger.info("get order view");

		Member member = (Member) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);
		order.setoCode(oCode); 

		List<OrderList> orderView = shopService.orderView(order);

		model.addAttribute("orderView", orderView);
	}

}
