package com.a2b.trip.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidematching.model.service.GuideBoardService;
import com.a2b.trip.guidematching.model.vo.GuideBoard;

@Service
public class schedule {
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
		private static final Logger logger = LoggerFactory.getLogger(schedule.class);
	
	@Autowired
	private GuideBoardService guideBoardService;

//	1초마다 실행  GB_CLOSE_DATE  2019-11-04 00:00:00.0
//	@Scheduled(cron="*/10 * * * * *")
//	public void testSCJ_1() throws ParseException {
//		ArrayList<GuideBoard> list = guideBoardService.selectGuideBoardList();
//		오늘 시간 받아오기
//		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
//		Date time = new Date();
//		String real_time = format1.format(time);
//		logger.info(real_time);
//		
//		Date nowDay = format1.parse(real_time);
//		
//		
//		for(GuideBoard gb : list) {
//			String close_date = gb.getGb_close_date();
//			Date closeDay = format1.parse(close_date);
//			if(nowDay.getTime() > closeDay.getTime()) {
//				logger.info("nowDay가 크다");
//				String gb_no = Integer.toString(gb.getGb_no());
//				int result = guideBoardService.close_gb(gb_no);
//			}else {
//				logger.info("closeDay가 크다");
//			}
//		}
//		
//		
//	} 시연할떄는 시연시간에 맞추어 10초 0분 0시(24시 기준) <--로 하자
	
//	매일 밤 12시 0분 10초 에 실행 
	@Scheduled(cron="10 0 0 * * *")
	public void testSCJ_1() throws ParseException {
		ArrayList<GuideBoard> list = guideBoardService.selectGuideBoardList();
//		오늘 시간 받아오기
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date time = new Date();
		String real_time = format1.format(time);
		logger.info(real_time);
		
		Date nowDay = format1.parse(real_time);
		
		
		for(GuideBoard gb : list) {
			String close_date = gb.getGb_close_date();
			Date closeDay = format1.parse(close_date);
			if(nowDay.getTime() >= closeDay.getTime()) {
				String gb_no = Integer.toString(gb.getGb_no());
				int result = guideBoardService.close_gb(gb_no);
			}
		}
		
	}
	
}
