package com.a2b.trip.guidematching.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidematching.model.dao.GuideBoardDao;
import com.a2b.trip.guidematching.model.vo.MyGuideMatching;

@Service("guideBoardService")
public class GuideBoardServiceImpl implements GuideBoardService {

	@Autowired
	private GuideBoardDao guideBoardDao;
	
	public GuideBoardServiceImpl() {}

	// 가이드 매칭 기록 목록 보기
	@Override
	public ArrayList<MyGuideMatching> selectMyGuideBoard(String gb_id) {
		return guideBoardDao.selectMyGuideBoard(gb_id);
	}
}
