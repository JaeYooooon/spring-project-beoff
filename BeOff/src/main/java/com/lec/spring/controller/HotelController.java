package com.lec.spring.controller;


import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.spring.domain.hotel.Hotel;
import com.lec.spring.domain.hotel.Room;
import com.lec.spring.service.HotelService;
import com.lec.spring.util.U;



@Controller
@RequestMapping("/hotel")
public class HotelController {


	private HotelService hotelService;

	@Autowired
	public void setHotelService(HotelService hotelSerivce) {
		this.hotelService = hotelSerivce;
	}
	public HotelController() {
		System.out.println(getClass().getName() + "() 생성");
	}
	
	// /hotel/list
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("regionList", hotelService.getRegionList());	
		model.addAttribute("hotelList", hotelService.getHotelList());
//		hotelService.list(page, model);
		return "/hotel/list";	
		
	}
	
	
	
	@PostMapping("/list")
	public String searchList(String hotelregion,String inn,String out, Model model) {
		String in1 = inn.replaceAll("-","");
		String out1 = out.replaceAll("-","");
		List<Hotel> list = hotelService.getSearchHotels(hotelregion,in1,out1);
		model.addAttribute("hotelList",list);
		model.addAttribute("hotel",hotelService.getHotelList());
		model.addAttribute("regionList", hotelService.getRegionList());
		model.addAttribute("checkin", inn);
		model.addAttribute("checkout", out);
		model.addAttribute("hregion", hotelregion);
			
		return "/hotel/list";
	}
	
	
	
	// /hotel/detail
	// 필요한 정보
	// 클릭한 숙소 ID name content -- 
	// 클릭한 숙소의 방 정보  room (image , name, price , bed)
	// 클릭한 숙소의 후기 정보  hcomment(user, reg, star,  content) --
	@GetMapping("/detail")
	public String detail(String id, Model model,String inn,String out) {
		model.addAttribute("hotel",hotelService.getHotelById(id));
		model.addAttribute("regionList", hotelService.getRegionList());
		model.addAttribute("checkin", inn);
		model.addAttribute("checkout", out);
		return "/hotel/detail"; 
	}
	
	@PostMapping("/detail")
	public String searchList1(String hotelregion,String inn,String out, Model model) {
		String in1 = inn.replaceAll("-","");
		String out1 = out.replaceAll("-","");
		List<Hotel> list = hotelService.getSearchHotels(hotelregion,in1,out1);
		model.addAttribute("hotelList",list);
		model.addAttribute("hotel",hotelService.getHotelList());
		model.addAttribute("regionList", hotelService.getRegionList());;
		model.addAttribute("checkin", inn);
		model.addAttribute("checkout", out);
			
		return "/hotel/list";
	}
	
	
	// /hotel/reserv
	// 필요한 정보
	// 로그인된 유저 ID 
	// 룸티켓..?
	
	
	
	
	
	@GetMapping("/reserve")
	public String reserv(String id, Model model,String inn,String out) {
		Room r = hotelService.reserve(id);
		
		model.addAttribute("r", r);
		model.addAttribute("room", hotelService.getRoomById(id));
		model.addAttribute("checkin", inn);
		model.addAttribute("checkout", out);
		return "hotel/reserve";
	}
	@PostMapping("/reservOk")
	public String getReserve(String id, String checkin, String checkout, Model model) {
		
		Room r = hotelService.reserve(id);
		hotelService.registerRoomticket(r, checkin, checkout);	
		return "redirect:/hotel/tickets?checkin="+checkin+"&checkout="+checkout ;
	}
	@GetMapping("/tickets")
	public String getTickets(Model model, String checkin, String checkout) {
		model.addAttribute("list",hotelService.getRoomTickets());	

		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		
		return "hotel/reservOk";
	}
	@PostMapping("/pageRows")
	public String pageRows(Integer page, Integer pageRows) {
		U.getSession().setAttribute("pageRows", pageRows);
		return "redirect:/hotel/list?page=" + page;
	}
}
