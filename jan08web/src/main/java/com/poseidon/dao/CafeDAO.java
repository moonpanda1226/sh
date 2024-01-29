package com.poseidon.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.poseidon.db.DBConnection;
import com.poseidon.dto.CafeDTO;

public class CafeDAO {
	
	DBConnection dbc = new DBConnection();
	
	public List<CafeDTO> menuchilck(String no) {
		
		List<CafeDTO> list = new ArrayList<CafeDTO>();
		Connection con = dbc.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM cafe";
		
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CafeDTO dto = CafeDTO();
				
				dto.setFno(rs.getInt("fno"));
				dto.setFname(rs.getString("fname"));
				dto.setFmenu(rs.getString("fmenu"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		
		}
		return list;
	}

	private CafeDTO CafeDTO() {
		return null;
	}
	
	
}
