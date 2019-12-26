package com.a2b.trip.guidebook.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidebook.model.dao.GuidebookDao;

@Service("guidebookService")
public class GuidebookServiceImpl implements GuidebookService {

	@Autowired
	private GuidebookDao guidebookDao;
	
	public GuidebookServiceImpl() {}
}
