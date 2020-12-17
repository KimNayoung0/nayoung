package org.ny.shop.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.ny.shop.model.vo.Cart;
import org.ny.shop.model.vo.CartList;
import org.ny.shop.model.vo.Goods;
import org.ny.shop.model.vo.OrderList;
import org.ny.shop.model.vo.Orders;
import org.ny.shop.model.vo.OrdersDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("shopDao")
public class ShopDao {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSessionTemplate sqlsession;

	public List<Goods> shopList(String gdsCate)throws Exception {
		return sqlsession.selectList("shop.list",gdsCate);
	}

	public Goods view(int gdsCode)throws Exception {
		return sqlsession.selectOne("shop.view",gdsCode);
	}
	
	public void addCart(Cart cart)throws Exception {
		sqlsession.insert("shop.addCart",cart);
	}
	
	public List<CartList> cartList(String userId)throws Exception{
		return sqlsession.selectList("shop.cartList",userId );
	}
	
	public void deleteCart(Cart cart)throws Exception{
		sqlsession.delete("shop.deleteCart",cart);
	}
	
	public void orderInfo(Orders order)throws Exception{
		sqlsession.insert("shop.orderInfo",order);
	}
	
	public void orderInfo_Details(OrdersDetail orderDetail)throws Exception{
		sqlsession.insert("shop.orderInfo_Details",orderDetail);
	}
	
	public void cartAllDelete(String userId)throws Exception{
		sqlsession.delete("shop.cartAllDelete",userId);
	}
	
	public List<Orders> orderList(Orders order)throws Exception{
		return sqlsession.selectList("shop.orderList",order);
	}

	public List<OrderList> orderView(Orders order)throws Exception{
		return sqlsession.selectList("shop.orderView",order);
	}
}
