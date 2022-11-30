package kh.nt.spring_02.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class Encryption {
	
	private MessageDigest md;
	private static final Logger logger = LoggerFactory.getLogger(Encryption.class);
	public String SHA256(String pass) {
		try {
			md=MessageDigest.getInstance("SHA-256");
			md.update(pass.getBytes());
			return String.format("%064x", new BigInteger(1, md.digest()));
		} catch (NoSuchAlgorithmException e) {
			logger.info("Encryption(SHA-256) Error");
		}
		return null;
	}
}
