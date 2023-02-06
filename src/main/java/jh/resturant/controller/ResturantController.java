package jh.resturant.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.xdevapi.JsonParser;

import jh.resturant.mapper.ResturantMapper;
import jh.resturant.vo.Pagination;
import jh.resturant.vo.ResturantVO;
import jh.resturant.vo.Search;
import jh.resturant.vo.TestVO;

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
	
	@RequestMapping("show.do")
	public String show(Model model) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6290000/eventbaseinfo/geteventbaseinfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=nV%2F4ELjExxo%2F%2B8iWVesr3uW3dNvYxJnqx6PrMv8Set%2FwYHkl6RmAwPjjTdmYp7T1BbOt9HxA7gV8%2BCHHrvuH8g%3D%3D"); /*Service Key*/
        //urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*한 페이지 결과 수*/
        //urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답 받을 데이터 형식*/
       // urlBuilder.append("&" + URLEncoder.encode("eventNm","UTF-8") + "=" + URLEncoder.encode("뮤지컬", "UTF-8")); /*행사명*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF8"));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line+ "\n\r");
        }
        rd.close();
        conn.disconnect();

        JSONParser jsonParser = new JSONParser();

	    //JSON데이터를 넣어 JSON Object 로 만들어 준다.
	    JSONObject jsonObject = (JSONObject)jsonParser.parse(sb.toString());
	    JSONArray array = (JSONArray) jsonObject.get("EventBaseInfo");
	    List<TestVO> list = new ArrayList<TestVO>(); 
	    System.out.println(array);
	    for(int i = 0; i<array.size(); i++) {
	        //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
	    	TestVO vo = new TestVO();
	        JSONObject object = (JSONObject) array.get(i);
	        vo.setId(object.get("id").toString());
	        vo.setEventNm(object.get("eventNm").toString());
	        vo.setEventVenue(object.get("eventVenue").toString());
	        vo.setEventInfo(object.get("eventInfo").toString());
	        vo.setEventBeginDate(object.get("eventBeginDate").toString());
	        vo.setEventEndDate(object.get("eventEndDate").toString());
	        vo.setPayYn(object.get("payYn").toString());
	        vo.setManageAgcNm(object.get("manageAgcNm").toString());
	        vo.setAuspiceAgcNm(object.get("auspiceAgcNm").toString());
	        vo.setSeatCount(object.get("seatCount").toString());
	        vo.setPrice(object.get("price").toString());
	        vo.setEnterAge(object.get("enterAge").toString());
	        vo.setNotice(object.get("notice").toString());
	        vo.setParkingLotAvail(object.get("parkingLotAvail").toString());
	        vo.setAddrRoad(object.get("addrRoad").toString());
	        vo.setLat(object.get("lat").toString());
	        vo.setLng(object.get("lng").toString());
	        vo.setSyncTime(object.get("syncTime").toString());
	        list.add(vo);
	    }
		model.addAttribute("list", list);
	    
	    
		return "show";
	}
	
	@RequestMapping("shop.do")
	public String shop(Model model,String eventNm) throws Exception{
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6290000/eventbaseinfo/geteventbaseinfo"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=nV%2F4ELjExxo%2F%2B8iWVesr3uW3dNvYxJnqx6PrMv8Set%2FwYHkl6RmAwPjjTdmYp7T1BbOt9HxA7gV8%2BCHHrvuH8g%3D%3D"); /*Service Key*/
	        //urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*한 페이지 결과 수*/
	        //urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답 받을 데이터 형식*/
	        urlBuilder.append("&" + URLEncoder.encode("eventNm","UTF-8") + "=" + URLEncoder.encode(eventNm, "UTF-8")); /*행사명*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF8"));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line+ "\n\r");
	        }
	        rd.close();
	        conn.disconnect();
	        JSONParser jsonParser = new JSONParser();
		    //JSON데이터를 넣어 JSON Object 로 만들어 준다.
		    JSONObject jsonObject = (JSONObject)jsonParser.parse(sb.toString());
		    JSONArray array = (JSONArray) jsonObject.get("EventBaseInfo");
		    List<TestVO> list = new ArrayList<TestVO>(); 
		    for(int i = 0; i<array.size(); i++) {
		        //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
		    	TestVO vo = new TestVO();
		        JSONObject object = (JSONObject) array.get(i);
		        vo.setId(object.get("id").toString());
		        vo.setEventNm(object.get("eventNm").toString());
		        vo.setEventVenue(object.get("eventVenue").toString());
		        vo.setEventInfo(object.get("eventInfo").toString());
		        vo.setEventBeginDate(object.get("eventBeginDate").toString());
		        vo.setEventEndDate(object.get("eventEndDate").toString());
		        vo.setPayYn(object.get("payYn").toString());
		        vo.setManageAgcNm(object.get("manageAgcNm").toString());
		        vo.setAuspiceAgcNm(object.get("auspiceAgcNm").toString());
		        vo.setSeatCount(object.get("seatCount").toString());
		        vo.setPrice(object.get("price").toString());
		        vo.setEnterAge(object.get("enterAge").toString());
		        vo.setNotice(object.get("notice").toString());
		        vo.setParkingLotAvail(object.get("parkingLotAvail").toString());
		        vo.setAddrRoad(object.get("addrRoad").toString());
		        vo.setLat(object.get("lat").toString());
		        vo.setLng(object.get("lng").toString());
		        vo.setSyncTime(object.get("syncTime").toString());
		        list.add(vo);
		        System.out.println(list.get(i));
		    }
			model.addAttribute("list", list);
		    
		return "shop";
	}
	
	@RequestMapping("/apiDetail.do")
	public String apiDetail(String id, Model model, String eventNm) throws Exception {
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6290000/eventbaseinfo/geteventbaseinfo"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=nV%2F4ELjExxo%2F%2B8iWVesr3uW3dNvYxJnqx6PrMv8Set%2FwYHkl6RmAwPjjTdmYp7T1BbOt9HxA7gV8%2BCHHrvuH8g%3D%3D"); /*Service Key*/
	        //urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*한 페이지 결과 수*/
	        //urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답 받을 데이터 형식*/
	        urlBuilder.append("&" + URLEncoder.encode("eventNm","UTF-8") + "=" + URLEncoder.encode(eventNm, "UTF-8")); /*행사명*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF8"));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line+ "\n\r");
	        }
	        rd.close();
	        conn.disconnect();
	        JSONParser jsonParser = new JSONParser();
		    //JSON데이터를 넣어 JSON Object 로 만들어 준다.
		    JSONObject jsonObject = (JSONObject)jsonParser.parse(sb.toString());
		    JSONArray array = (JSONArray) jsonObject.get("EventBaseInfo");
		    TestVO vo = new TestVO();
		    for(int i = 0; i<array.size(); i++) {
		        //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
		        JSONObject object = (JSONObject) array.get(i);
		        vo.setId(object.get("id").toString());
		        vo.setEventNm(object.get("eventNm").toString());
		        vo.setEventVenue(object.get("eventVenue").toString());
		        vo.setEventInfo(object.get("eventInfo").toString());
		        vo.setEventBeginDate(object.get("eventBeginDate").toString());
		        vo.setEventEndDate(object.get("eventEndDate").toString());
		        vo.setPayYn(object.get("payYn").toString());
		        vo.setManageAgcNm(object.get("manageAgcNm").toString());
		        vo.setAuspiceAgcNm(object.get("auspiceAgcNm").toString());
		        vo.setSeatCount(object.get("seatCount").toString());
		        vo.setPrice(object.get("price").toString());
		        vo.setEnterAge(object.get("enterAge").toString());
		        vo.setNotice(object.get("notice").toString());
		        vo.setParkingLotAvail(object.get("parkingLotAvail").toString());
		        vo.setAddrRoad(object.get("addrRoad").toString());
		        vo.setLat(object.get("lat").toString());
		        vo.setLng(object.get("lng").toString());
		        vo.setSyncTime(object.get("syncTime").toString());
		    }
		    model.addAttribute("vo", vo);
		return "apiDetail";
	}
}
