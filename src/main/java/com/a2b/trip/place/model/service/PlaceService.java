package com.a2b.trip.place.model.service;

import java.sql.Date;
import java.util.ArrayList;

import com.a2b.trip.place.model.vo.Place;
import com.a2b.trip.place.model.vo.PlaceAll;
import com.a2b.trip.place.model.vo.PlaceDaylist;

public interface PlaceService {
	int insertDaylist(PlaceDaylist daylist);
	ArrayList<PlaceDaylist> selectDaylist(String member_id);
	ArrayList<Date> selectDatelist(int key);
	ArrayList<Place> selectPlaceList(String member_id);
	ArrayList<Place> selectDailyPlaceList(Place place);
	int deletePlace(String place_code);
	int deleteDaylist(int daylist_no);
	int updateDaylist(PlaceDaylist daylist);
	
	ArrayList<PlaceDaylist> guideDaylist(String member_id);
	PlaceDaylist guideDaylistOne(String daylist_no);
	ArrayList<PlaceAll> guidePlacelist(PlaceAll placeall);
}
