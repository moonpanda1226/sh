package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.db.DBConnection;
import com.library.dto.MemberDTO;

public class MemberDAO extends AbstractDAO {

	public MemberDTO login(MemberDTO dto) {

		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) as count, name FROM member WHERE id=? AND pw=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());

			rs = pstmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();

		}finally {
			close(rs, pstmt, con);
			
		}
		return dto;

	}

	public int join(MemberDTO dto) {

		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member(id, pw, name) VALUES(?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);

		}
		return result;

	}

}
