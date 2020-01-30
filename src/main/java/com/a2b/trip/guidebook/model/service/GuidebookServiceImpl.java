package com.a2b.trip.guidebook.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidebook.model.dao.GuidebookDao;
import com.a2b.trip.guidebook.model.vo.Guidebook;

@Service("guidebookService")
public class GuidebookServiceImpl implements GuidebookService {

	@Autowired
	private GuidebookDao guidebookDao;
	
	public GuidebookServiceImpl() {}
	
	// 가이드북 등록
	@Override
	public int insertGuidebook(Guidebook guidebook) {
		return guidebookDao.insertGuidebook(guidebook);
	}

	@Override
	public int updateGuidebook(Guidebook guidebook) {
		return guidebookDao.updateGuidebook(guidebook);
	}

// 내 가이드북 보기
@Override
public ArrayList<Guidebook> selectGuidebookMyList(String book_id) {
	return guidebookDao.selectGuidebookMyList(book_id);
}

// 가이드북 삭제
@Override
public int deleteGuidebook(String book_no) {
	return guidebookDao.deleteGuidebook(book_no);
}

// 가이드북 상세 보기
@Override
public Guidebook selectMyGuidebookOne(String book_no) {
	return guidebookDao.selectMyGuidebookOne(book_no);
}
			

			
}
