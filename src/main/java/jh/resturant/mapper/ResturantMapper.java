package jh.resturant.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import jh.resturant.vo.ResturantVO;
import jh.resturant.vo.Search;

@Mapper
public interface ResturantMapper {
	
	public List<ResturantVO> getLists(Search search);
	
	public int getListCnt(Search search);
}
