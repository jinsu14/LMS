package com.gd.LMS.schedule.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.schedule.service.CalendarService;
import com.gd.LMS.commons.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CalendarController {
	@Autowired CalendarService calendarService;
	
	//calendarDayList 수강일정리스트(달력)
	@GetMapping("/calendarList")
	public String calendarDayList(Model model
			, @RequestParam(name = "year", defaultValue = "-1") int year
			, @RequestParam(name = "month", defaultValue = "-1") int month) {
		
		log.debug(TeamColor.KJS + "[CalendarController.getConsultReservationList] year : " + year);
		log.debug(TeamColor.KJS + "[CalendarController.getConsultReservationList] month : " + month);
	
		Map<String,Object> map = calendarService.getCalendarDayListByMonth(year,month);
		
		log.debug(TeamColor.KJS + "[CalendarController.getCalendarDayListByMonth] map : " + map);
		
		model.addAttribute("consultReservationListByMonth", map.get("consultReservationListByMonth"));
		model.addAttribute("startBlank", map.get("startBlank"));
		model.addAttribute("endDay", map.get("endDay"));
		model.addAttribute("endBlank", map.get("endBlank"));
		model.addAttribute("totalTd", map.get("totalTd"));
		model.addAttribute("year", map.get("year"));
		model.addAttribute("month", map.get("month"));
		
		return "/schedule/calendarList";
	
	}

	
	
	
	
	  
	  
	  
	  
	  
	 
}
