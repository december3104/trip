package com.a2b.trip.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	//이용방법 페이지로 이동
	@RequestMapping("goInfo.do")
	public String searchMap() {
		return "/info";		
	}
}
