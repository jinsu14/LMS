package com.gd.LMS.department.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.department.service.DepartmentService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Department;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DepartmentController {
	
	@Autowired DepartmentService departmentService;
	

	//내가 속한 학과(부서) 리스트 조회
	@GetMapping({"/employee/departMentList", "/professor/departMentList"})
	public String getDepartMentList (PagingVo vo, Model model, HttpSession session, Map<String, Object> map,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) {
		
		String memberDepartmentCode = (String) session.getAttribute("memberDepartmentCode");
		log.debug(TeamColor.BJH + "memberDepartmentCode > " + memberDepartmentCode);

		map.put("departmentCode", memberDepartmentCode);
		map.put("keyword", keyword);
		map.put("searchType", searchType);

		log.debug(TeamColor.BJH + "map1 > " + map);

		int totalCount = departmentService.countDepartment(map);
		log.debug(TeamColor.BJH + "current/rowPer/total : " + currentPage + "/" + rowPerPage + "/" + totalCount);


        vo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
        // 이전 페이지 시작 글 번호와 현재 변경되는 페이지의 시작 글번호에 대한 일치 시키는거 많은 변경이 필요하므로 그냥 1로 처리함
        if(vo.getBeginRow() >= totalCount){
            vo = new PagingVo(1, totalCount, rowPerPage, keyword, searchType);
        }
		log.debug(TeamColor.BJH + "PagingVo : " + vo);

		map.put("beginRow", vo.getBeginRow());
		map.put("rowPerPage", vo.getRowPerPage());

		log.debug(TeamColor.BJH + "map2 > " + map);

		List<Department> list = departmentService.selectDepartment(map);
		log.debug(TeamColor.BJH + "list : " + list);

		model.addAttribute("paging", vo);
		model.addAttribute("list", list);

		log.debug(TeamColor.BJH + "학부 전체 리스트");
		return "/department/departMentList";
	}	
	
	
	//학부 상세보기
	@GetMapping({"/employee/departMentOne", "/professor/departMentOne"})
	public String getDepartMentOne (Model model,HttpSession session,
			@RequestParam(value = "departmentCode") int departmentCode) {
		log.debug(TeamColor.BJH + "학부 상세보기 컨트롤러 진입=================");
		
		Map<String, Object> map = departmentService.getDepartMentOne(departmentCode);
		model.addAttribute("map",map);
		log.debug(TeamColor.BJH + "map에 학부정보 담아보내기" + map);
		
		return "member/departMentOne";
	}

	
	//학부 추가폼
	@GetMapping("/employee/addDeparMent")
	public String addDepartMent (Model model, Department department) {
		log.debug(TeamColor.BJH + "department 추가 폼 컨트롤러 진입==============");
		model.addAttribute("department", department);
			
		return "department/addDepartment";
	}
	//학부 추가 액션
	@PostMapping("/employee/addDepartment")
	public String addDepartment(Department department) {
		log.debug(TeamColor.BJH+ "department 추가 액션 컨트롤러 실행=============");
		
		int row= departmentService.addDepartMent(department);
		if(row !=0) {
			log.debug(TeamColor.BJH + "학부추가 성공!!!!!! 오예!");
			return 	"redirect:/department/departmentList";
		}
		return "redirect:/department/addDepartment";
	}
		
	// 학부 수정 페이지 이동
	@GetMapping("/employee/modifyDepartment")
	public String updateTotalNotice(Model model, @RequestParam(value = "departmentCode") int departmentCode) {
		
		Map<String, Object>  department = departmentService.getDepartMentOne(departmentCode);
		
		model.addAttribute("department", department);
		log.debug(TeamColor.BJH + "학부 수정 페이지 이동");
		
		return "department/modifyDepartment";
	}

	// 전체공지사항 수정
	@PostMapping("/employee/modifyDepartment")
	public String modifyDepartment(Department department, RedirectAttributes redirectAttributes) {
		
		int count = departmentService.modeifyDepartMentOne(department);
		redirectAttributes.addAttribute("departmentCode", department.getDepartmentCode());
		
		if (count >= 1) {
			log.debug(TeamColor.BJH + "학부 수정");
			
			return "redirect:/employee/departmentOne";
		}
		
		return "redirect:/employee/modifyDepartment";
	}

		// 전체공지사항 삭제
		@GetMapping("/employee/removeDepartment")
		public String removeDepartment(@RequestParam(value = "departmentCode") int departmentCode, 
				RedirectAttributes redirectAttributes) {
			
			int count = departmentService.removeDepartMent(departmentCode);
			redirectAttributes.addAttribute("departmentCode", departmentCode);
			
			if (count >= 1) {
				log.debug(TeamColor.BJH + "학부 삭제........");
				return "redirect:/employee/departmentList";
			}
			
			return "redirect:/employee/departmentOne";
		}
	
}
