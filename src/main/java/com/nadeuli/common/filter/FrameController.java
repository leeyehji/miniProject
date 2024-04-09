package com.nadeuli.common.filter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "frame")
public class FrameController {

	@GetMapping(value = "header")
	public String header() {
		return "frame/header";
	}
	
	@GetMapping(value = "nav")
	public String nav() {
		return "frame/nav";
	}
	
	@GetMapping(value = "footer")
	public String footer() {
		return "frame/footer";
	}
}
