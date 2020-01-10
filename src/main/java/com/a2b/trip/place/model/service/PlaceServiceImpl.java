package com.a2b.trip.place.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.place.model.dao.PlaceDao;
import com.a2b.trip.place.model.vo.Place;
import com.a2b.trip.place.model.vo.PlaceDaylist;

@Service("placeService")
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceDao placeDao;
	
	public PlaceServiceImpl() {}

	//일정리스트 생성 메소드
	@Override
	public int insertDaylist(PlaceDaylist daylist) {
		return placeDao.insertDaylist(daylist);
	}
	
	//회원의 일정리스트 조회
	@Override
	public ArrayList<PlaceDaylist> selectDaylist(String member_id) {
		return placeDao.selectDaylist(member_id);
	}
	
	//날짜 범위 리스트 생성
	@Override
	public ArrayList<Date> selectDatelist(int key) {
		return placeDao.selectDatelist(key);
	}

	//회원의 장소 리스트 조회
	@Override
	public ArrayList<Place> selectPlaceList(String member_id) {
		return placeDao.selectPlaceList(member_id);
	}

	//날짜 클릭시 해당 날짜의 장소리스트 조회
	@Override
	public ArrayList<Place> selectDailyPlaceList(Place place) {
		return placeDao.selectDailyPlaceList(place);
	}

	//장소 리스트에서 장소 삭제
	@Override
	public int deletePlace(String place_code) {
		return placeDao.deletePlace(place_code);
	}
	
	//일정 목록에서 일정 삭제
	@Override
	public int deleteDaylist(int daylist_no) {
		return placeDao.deleteDaylist(daylist_no);
	}
}
