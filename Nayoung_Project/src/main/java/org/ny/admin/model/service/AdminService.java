package org.ny.admin.model.service;

import java.util.List;

import org.ny.admin.model.dao.AdminDao;
import org.ny.shop.model.vo.Goods;
import org.ny.shop.model.vo.OrderList;
import org.ny.shop.model.vo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminService {

	@Autowired
	@Qualifier("adminDao")
	AdminDao adminDao;

	public void insertGds(Goods gds) throws Exception {
		adminDao.insertGds(gds);
	}

	public List<Goods> goodsList() throws Exception {
		return adminDao.goodsList();
	}

	public Goods goodsView(int gdsCode) throws Exception {
		return adminDao.goodsView(gdsCode);
	}

	public int goodsModify(Goods goods) throws Exception {
		return adminDao.goodsModify(goods);

	}

	public Object goodsDelete(int gdsCode) throws Exception {
		return adminDao.goodsDelete(gdsCode);

	}
	
	public List<Orders> orderList()throws Exception{
		return adminDao.orderList();
	}
	
	public List<OrderList> orderView(Orders order)throws Exception{
		return adminDao.orderView(order);
	}
	
	public void delivery(Orders order)throws Exception{
		adminDao.delivery(order);
	}

	public void changeStock(Goods gds)throws Exception{
		adminDao.changeStock(gds);
	}

	public void changeSell(Goods gds)throws Exception {
		adminDao.changeSell(gds);
		
	}
}
