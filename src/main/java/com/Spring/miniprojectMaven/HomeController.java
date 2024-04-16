package com.Spring.miniprojectMaven;


import com.Spring.miniprojectMaven.dto.HomeDTO;
import com.Spring.miniprojectMaven.dao.HomeDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
@RequiredArgsConstructor
public class HomeController {

	private final HomeDAO homeDAO;

	@RequestMapping(value = "/")
	public String home(Model model) {
		return "mainpage";
	}

	@GetMapping(value = "/getTop5Destinations")
	@ResponseBody
	public List<HomeDTO> getTop5Destinations() {
		List<HomeDTO> top5Destinations = homeDAO.selectTop5();
//		log.info("top5 = {}", top5Destinations);
		System.out.println("top5Destinations = " + top5Destinations);
		return top5Destinations;
	}
}
