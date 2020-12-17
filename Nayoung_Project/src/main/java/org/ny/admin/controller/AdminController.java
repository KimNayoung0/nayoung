package org.ny.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ny.admin.model.service.AdminService;
import org.ny.admin.util.UploadFileUtils;
import org.ny.shop.model.vo.Goods;
import org.ny.shop.model.vo.OrderList;
import org.ny.shop.model.vo.Orders;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	@Qualifier("adminService")
	AdminService adminService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	private static final Logger Logger = LoggerFactory.getLogger(AdminController.class);

	// 관리자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		Logger.info("get index");
	}

	// 상품 등록 페이지
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister() throws Exception {
		Logger.info("get goods register");
	}

	// 상품등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String insertGds(Goods gds, MultipartFile file) throws Exception {

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			// gdsImg에 원본파일 경로 + 파일명 저장
			gds.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			gds.setGdsThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else {
			fileName = File.separator + "images" + File.separator + "none.jpg";
			// 미리 준비된 none.png 파일을 대신 출력함

			gds.setGdsImg(fileName);
			gds.setGdsThumbImg(fileName);
		}

		adminService.insertGds(gds);
		return "redirect:/admin/adminPage?currentPage=1";
	}

	// 상품 목록 페이지
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model) throws Exception {
		Logger.info("get goods list");

		List<Goods> gList = adminService.goodsList();
		model.addAttribute("gList", gList);
	}

	// 상품 상세 페이지
	@RequestMapping(value = "/goods/view", method = RequestMethod.GET)
	public void getGoodsView(@RequestParam("gdsCode") int gdsCode, Model model) throws Exception {
		Logger.info("get goods view");

		Goods goods = adminService.goodsView(gdsCode);
		model.addAttribute("goods", goods);
	}

	// 상품 수정 페이지
	@RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("gdsCode") int gdsCode, Model model) throws Exception {
		Logger.info("get goods modify");

		Goods goods = adminService.goodsView(gdsCode);
		model.addAttribute("goods", goods);
	}

	// 상품 수정 페이지
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String postGoodsModify(Goods goods, MultipartFile file, HttpServletRequest req) throws Exception {

		// 새로운 파일이 등록 되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("gdsThumbImg")).delete();

			// 새로 첨부한 파일 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			goods.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			goods.setGdsThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {// 새로운 파일이 등록되지 않았다면, 기존 이미지를 그대로 사용
			goods.setGdsImg(req.getParameter("gdsImg"));
			goods.setGdsThumbImg(req.getParameter("gdsThumbImg"));
		}

		adminService.goodsModify(goods);
		return "redirect:/admin/goods/view?gdsCode=" + goods.getGdsCode();
	}

	// 상품 삭제 페이지
	@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("gdsCode") int gdsCode) throws Exception {
		Logger.info("post goods delete");

		adminService.goodsDelete(gdsCode);
		return "redirect:/admin/goods/list";
	}

	// ck 에디터에서 파일 업로드
	// 저장하는 폴더가 연/월/일로 나누어 지지않고, ckUpload 폴더에 모두 들어가게됨.
	// 모든 이미지가 한 폴더에 들어가게 될 경우 파일 명이 똑같아서 덮어쓰기가 될 가능성이 있어 UUID를 이용하요 중복을 방지함
	// 이미지 업로드가 완료되면 메세지를 띄우도록 설정
	@RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam MultipartFile upload) throws Exception {
		Logger.info("post CKEditor img upload");

		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/ckUpload/" + uid + "_" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
		Logger.info("get order list");

		List<Orders> orderList = adminService.orderList();

		model.addAttribute("orderList", orderList);
	}

	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderView(@RequestParam("n") String oCode, Orders order, Model model) throws Exception {
		Logger.info("get order view");

		order.setoCode(oCode);
		List<OrderList> orderView = adminService.orderView(order);

		model.addAttribute("orderView", orderView);
	}

	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
	public String delivery(Orders order) throws Exception {
		Logger.info("post order view");

		adminService.delivery(order);

		List<OrderList> orderView = adminService.orderView(order);
		Goods gds = new Goods();

		for (OrderList i : orderView) {
			gds.setGdsCode(i.getGdsCode());
			gds.setGdsStock(i.getOdQt());
			adminService.changeStock(gds);
			adminService.changeSell(gds);

		}

		return "redirect:/admin/shop/orderView?n=" + order.getoCode();
	}

}
