package jh.resturant.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jh.resturant.mapper.ResturantMapper;
import jh.resturant.vo.ResturantVO;

@Controller
public class ResturantController {

	
	@Autowired
	ResturantMapper resturantMapper;
	
	@RequestMapping("/resList.do")
	public String resList(Model model) {
		List<ResturantVO> list = resturantMapper.getLists();
		model.addAttribute("list",list);
		
		return "list";
	}
}
