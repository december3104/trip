package com.a2b.trip.guidebook.model.service;

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
}
