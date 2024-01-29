package com.poseidon.dao;
//로그인, 회원가입, 회원 탈퇴처리, 회원 정보보기

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.poseidon.dto.MemberDTO;


public class MemberDAO extends AbstractDAO {

	public MemberDTO login(MemberDTO dto) {

		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) as count, mname FROM member WHERE mid=? AND mpw=? AND mgrade > 4";
		
		try {
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMpw());
			
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setCount(rs.getInt("count"));
				dto.setMname(rs.getString("mname"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		
		
		return dto;
	}

	public MemberDTO myInfo(MemberDTO dto) {
		
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member WHERE mid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setMno(rs.getInt("mno"));
				dto.setMname(rs.getString("mname"));
				dto.setMpw(rs.getNString("mpw"));
				dto.setMdate(rs.getNString("mdate"));
				dto.setMgrade(rs.getInt("mgrade"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	public int newPW(MemberDTO dto) {
		
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET mpw=? WHERE mid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMpw());
			pstmt.setString(2, dto.getMid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, con);
			
		}
		return result;
	}

	public int join(MemberDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member (mid, mname, mpw) VALUE (?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMname());
			pstmt.setString(3, dto.getMpw());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return result;
	}

	public int idCheck(MemberDTO dto) {

		int result = 1;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM member WHERE mid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		
		
		
		
		return result;
	}

	public List<Map<String, Object>> readData(MemberDTO dto) {

		List<Map<String, Object>> data = new ArrayList<Map<String,Object>>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM visitview WHERE mno=(SELECT mno FROM member WHERE mid=?) ORDER BY vno DESC";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> e = new HashMap<String, Object>();
				e.put("vno", rs.getInt("vno"));
				e.put("board_no", rs.getInt("board_no"));
				e.put("board_title", rs.getString("board_title"));
				//e.put("mno", rs.getInt("mno"));
				e.put("vdate", rs.getString("vdate"));
				data.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		
		
		return data;
	}
	

	

}
