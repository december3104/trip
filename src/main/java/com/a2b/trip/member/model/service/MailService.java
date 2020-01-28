package com.a2b.trip.member.model.service;

public interface MailService {
	boolean send(String subject, String text, String from, String to, String filePath);
}
