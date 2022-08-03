package com.itwill.shop.service;

import java.util.ArrayList;

import com.itwill.shop.dao.UserInfoDao;
import com.itwill.shop.dto.UserInfo;

public class UserInfoService {
	private UserInfoDao userInfoDao;

	public UserInfoService() throws Exception {
		userInfoDao = new UserInfoDao();
	}

	/*
	 * 회원 가입
	 */
	public int create(UserInfo userinfo) throws Exception {
		
		// 1.아이디 중복 체크
		if (userInfoDao.existedUserInfo(userinfo.getU_id())) {
			throw new ExistedUserException(userinfo.getU_id() + " 는 이미존재하는 아이디입니다.");
		}
		return userInfoDao.create(userinfo);

	}

	/*
	 * 회원 로그인
	 */
	public UserInfo login(String u_id, String u_pw) throws Exception {
		
		// 1.아이디 존재 여부
		UserInfo userInfo = userInfoDao.findUser(u_id);
		if (userInfo == null) {
			throw new UserNotFoundException(u_id + " 는 존재하지않는 아이디 입니다.");
		}
		
		// 2.패스워드 일치 여부
		if (!userInfo.isMatchPassword(u_pw)) {
			throw new PasswordMismatchException("패쓰워드가 일치하지않습니다.");
		}
		return userInfo;
	}

	/*
	 * 회원 전체 리스트
	 */
	public ArrayList<UserInfo> findUserInfoList() throws Exception {
		return userInfoDao.findUserInfoList();
	}

	/*
	 * 회원 1명 보기
	 */
	public UserInfo findUser(String u_id) throws Exception {
		UserInfo findUser = userInfoDao.findUser(u_id);
		return findUser;
	}

	/*
	 * 회원 정보 수정
	 */
	public int update(UserInfo userinfo) throws Exception {
		return userInfoDao.update(userinfo);
	}

	/*
	 * 회원 탈퇴
	 */
	public int remove(String u_id) throws Exception {
		return userInfoDao.remove(u_id);
	}

	/*
	 * 아이디 중복 체크
	 */
	public boolean isDuplicateId(String u_id) throws Exception {
		boolean isExist = userInfoDao.existedUserInfo(u_id);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}

}
