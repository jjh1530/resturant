package jh.resturant.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import jh.resturant.vo.ResturantVO;

@Mapper
public interface ResturantMapper {
	
	public List<ResturantVO> getLists();
}