package com.a2b.trip.place.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.place.model.vo.Place;
import com.a2b.trip.place.model.vo.PlaceDaylist;

@Repository("placeDao")
public class PlaceDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public PlaceDao() {}

	//일정리스트 생성
	public int insertDaylist(PlaceDaylist daylist) {
		return sqlSession.insert("placeMapper.insertDaylist", daylist);
	}
	
	//회원의 일정리스트 조회
	public ArrayList<PlaceDaylist> selectDaylist(String member_id) {
		List<PlaceDaylist> list = sqlSession.selectList("placeMapper.selectDaylist", member_id);
		return (ArrayList<PlaceDaylist>)list;
	}

	//날짜 범위 리스트 생성
	public ArrayList<Date> selectDatelist(int key) {
		List<Date> list = sqlSession.selectList("placeMapper.selectDatelist", key);
		return (ArrayList<Date>)list;
	}

	//회원의 장소리스트 조회
	public ArrayList<Place> selectPlaceList(String member_id) {
		List<Place> list = sqlSession.selectList("placeMapper.selectPlaceList", member_id);
		return (ArrayList<Place>)list;
	}
	
	//날짜 클릭시 해당 날짜의 장소리스트 조회
	public ArrayList<Place> selectDailyPlaceList(Place place) {
		List<Place> list = sqlSession.selectList("placeMapper.selectDailyPlaceList", place);
		return (ArrayList<Place>)list;
	}

	//장소 리스트에서 장소 삭제 처리 메소드
	public int deletePlace(String place_code) {
		return sqlSession.delete("placeMapper.deletePlace", place_code);
	}
	
	//일정 목록에서 일정 삭제
	public int deleteDaylist(int daylist_no) {
		return sqlSession.delete("placeMapper.deleteDaylist", daylist_no);
	}
}
