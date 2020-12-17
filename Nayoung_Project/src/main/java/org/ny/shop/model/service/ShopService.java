package org.ny.shop.model.service;

import java.util.List;

import org.ny.shop.model.dao.ShopDao;
import org.ny.shop.model.vo.Cart;
import org.ny.shop.model.vo.CartList;
import org.ny.shop.model.vo.Goods;
import org.ny.shop.model.vo.OrderList;
import org.ny.shop.model.vo.Orders;
import org.ny.shop.model.vo.OrdersDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("shopService")
public class ShopService {
	
	@Autowired
	@Qualifier("shopDao")
	ShopDao shopDao;

	public List<Goods> shopList(String gdsCate)throws Exception {	
		return shopDao.shopList(gdsCate);
	}

	public Goods view(int gdsCode)throws Exception {
		return shopDao.view(gdsCode);
	}
	
	public void addCart(Cart cart)throws Exception{
		shopDao.addCart(cart);
	}
	
	public List<CartList> cartList(String userId)throws Exception{
		return shopDao.cartList(userId);
	}
	
	public void deleteCart(Cart cart)throws Exception{
		shopDao.deleteCart(cart);
	}
	
	public void orderInfo(Orders order)throws Exception{
		shopDao.orderInfo(order);
	}
	
	public void orderInfo_Details(OrdersDetail orderDetail)throws Exception{
		shopDao.orderInfo_Details(orderDetail);
	}
	
	public void cartAllDelete(String userId)throws Exception{
		shopDao.cartAllDelete(userId);
	}
	
	public List<Orders> orderList(Orders order)throws Exception{
		return shopDao.orderList(order);
	}
	
	public List<OrderList> orderView(Orders order)throws Exception{
		return shopDao.orderView(order);
	}
}
