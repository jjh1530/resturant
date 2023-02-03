package jh.resturant.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			,@ModelAttribute("search")Search search
			, HttpServletRequest request) throws Exception{
		
		
		//검색
		model.addAttribute("search", search);
		search.setKeyword1(keyword1);
		search.setKeyword2(keyword2);
		search.setKeyword3(keyword3);
		search.setKeyword4(keyword4);
		search.setKeyword5(keyword5);
		
		
		int listCnt = resturantMapper.getListCnt(search);
		search.pageInfo(page, range, listCnt);
		//페이징
		model.addAttribute("pagination", search);
		model.addAttribute("keyword1", keyword1);
		model.addAttribute("keyword2", keyword2);
		model.addAttribute("keyword3", keyword3);
		model.addAttribute("keyword4", keyword4);
		model.addAttribute("keyword5", keyword5);
		
		List<ResturantVO> list = resturantMapper.getLists(search);
		
		model.addAttribute("list",list);
		model.addAttribute("listCnt",listCnt);
		
		return "list";
	}
	
	
	@RequestMapping("/detail.do")
	public String detail(String businessNumber,Model model) throws Exception {
		ResturantVO vo = resturantMapper.goDetail(businessNumber);
		model.addAttribute("vo",vo);
		return "detail";
	}
	
	@RequestMapping("shop.do")
	public String shop() throws Exception{
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6290000/eventbaseinfo/geteventbaseinfo"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "nV%2F4ELjExxo%2F%2B8iWVesr3uW3dNvYxJnqx6PrMv8Set%2FwYHkl6RmAwPjjTdmYp7T1BbOt9HxA7gV8%2BCHHrvuH8g%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*응답 받을 데이터 형식*/
	        urlBuilder.append("&" + URLEncoder.encode("eventNm","UTF-8") + "=" + URLEncoder.encode("뮤지컬", "UTF-8")); /*행사명*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
		return "main";
	}
}
