package com.springbootstudy.dhere.service;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.springbootstudy.dhere.dao.FollowerDao;
import com.springbootstudy.dhere.dao.MemberDao;
import com.springbootstudy.dhere.dao.ScrapDao;
import com.springbootstudy.dhere.domain.Member;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private PasswordEncoder passwordEncoder;

	// 로그인 프로세스
	@Override
	public int login(String email, String pass) {

		int result = -1;
		Member m = memberDao.getMember(email);
		System.out.println(email);
		System.out.println(pass);
		System.out.println(m.getEmail());
		System.out.println(m.getPass());

		// 회원이 없을 때
		if (m == null) {
			return result;
		}

		if (passwordEncoder.matches(pass, m.getPass())) { // 로그인 성공 했을 때
			result = 1;
		} else { // 로그인 실패 했을 때
			result = 0;
		}

		return result;
	}

	// 회원 정보 가져오기
	@Override
	public Member getMember(String email) {
		return memberDao.getMember(email);
	}

	// 회원가입
	public void addMember(Member m) {
		m.setPass(passwordEncoder.encode(m.getPass()));
		System.out.println(m.getPass());
		memberDao.addMember(m);
	}

	// 아이디 중복확인 메서드
	@Override
	public boolean overEmailCheck(String email) {
		boolean result = false;
		Member m = memberDao.getMember(email);
		if (m == null) {
			result = true;
		}
		return result;
	}

	// 회원 정보 수정시에 기존 비밀번호가 맞는지 체크하는 메서드
	public boolean memberPassCheck(String email, String pass) {
		String dbPass = memberDao.memberPassCheck(email, pass);
		boolean result = false;

		if (passwordEncoder.matches(pass, dbPass)) {
			result = true;
		}

		return result;
	}

	// 회원정보를 DAO를 이용해 회원테이블에서 수정하는 메서드
	public void updateMember(Member member) {

		if (member.getPass() != null) {
			member.setPass(passwordEncoder.encode(member.getPass()));
			System.out.println(member.getPass());
		}
		memberDao.updateMember(member);
	}

	// 휴대폰 인증서비스
	public void certifiedPhoneNumber(String phoneNumber, String numStr) {
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("NCSWTTGCALU2PK6M",
				"F4R9OHVHA97LZF75ZOCHVBNICKHITPWE", "https://api.coolsms.co.kr");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01098443163");
		message.setTo(phoneNumber);
		message.setText("Dhere  인증번호는 [" + numStr + "] 입니다. ");

		try {
			// send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
			messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
			// 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
		}

	}
	
	// 닉네임 중복확인 메서드
		@Override
		public boolean overNickNameCheck(String nickname) {
			boolean result = false;
			Member m = memberDao.getMemberNickName(nickname);
			if (m == null) {
				result = true;
			}
			return result;
		}

}
