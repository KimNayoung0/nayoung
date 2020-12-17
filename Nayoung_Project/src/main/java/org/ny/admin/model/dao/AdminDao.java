package org.ny.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.ny.shop.model.vo.Goods;
import org.ny.shop.model.vo.OrderList;
import org.ny.shop.model.vo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSessionTemplate sqlsession;

	public void insertGds(Goods gds) throws Exception {
		sqlsession.insert("admin.insertGds", gds);
	}

	public List<Goods> goodsList() throws Exception {
		return sqlsession.selectList("admin.goodsList");

	}

	public Goods goodsView(int gdsCode) throws Exception {
		return sqlsession.selectOne("admin.goodsView", gdsCode);
	}

	public int goodsModify(Goods goods) throws Exception {
		return sqlsession.update("admin.goodsModify", goods);
	}

	public Object goodsDelete(int gdsCode) throws Exception {
		return sqlsession.delete("admin.goodsDelete", gdsCode);
	}

	public List<Orders> orderList()throws Exception{
		return sqlsession.selectList("admin.orderList");
	}
	
	public List<OrderList> orderView(Orders order)throws Exception{
		return sqlsession.selectList("admin.orderView",order);
	}
	
	public void delivery(Orders order)throws Exception{
		sqlsession.update("admin.delivery",order);
	}
	
	public void changeStock(Goods gds)throws Exception{
		sqlsession.update("admin.changeStock",gds);
	}

	public void changeSell(Goods gds)throws Exception {
		sqlsession.update("admin.changeSell",gds);
		
	}
}
