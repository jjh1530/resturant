package jh.resturant.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jh.resturant.mapper.ResturantMapper;
import jh.resturant.vo.Pagination;
import jh.resturant.vo.ResturantVO;
import jh.resturant.vo.Search;

@Controller
public class ResturantController {

	
	@Autowired
	ResturantMapper resturantMapper;
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/list.do")
	public String resList(Model model, ResturantVO vo
			,@RequestParam(required=false,defaultValue="1")int page
			,@RequestParam(required=false,defaultValue="1")int range
			,@RequestParam(required=false, defaultValue="")String keyword1
			,@RequestParam(required=false, defaultValue="")String keyword2
			,@RequestParam(required=false, defaultValue="")String keyword3
			,@RequestParam(required=false, defaultValue="")String keyword4
			,@RequestParam(required=false, defaultValue="")String keyword5
			,@ModelAttribute("search")Search search) {

		
		//검색
		model.addAttribute("search", search);
		search.setKeyword1(keyword1);
		search.setKeyword2(keyword2);
		search.setKeyword3(keyword3);
		search.setKeyword4(keyword4);
		search.setKeyword5(keyword5);
		
		List<ResturantVO> list = resturantMapper.getLists(search);
		int listCnt = resturantMapper.getListCnt(search);
		
		search.pageInfo(page, range, listCnt);
		
		//페이징
		model.addAttribute("pagination", search);
		model.addAttribute("keyword1", keyword1);
		model.addAttribute("keyword2", keyword2);
		model.addAttribute("keyword3", keyword3);
		model.addAttribute("keyword4", keyword4);
		model.addAttribute("keyword5", keyword5);
		
		model.addAttribute("list",list);
		model.addAttribute("listCnt",listCnt);
		
		return "list";
	}
}
