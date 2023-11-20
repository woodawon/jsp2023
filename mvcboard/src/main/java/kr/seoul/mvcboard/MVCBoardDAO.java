package kr.seoul.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class MVCBoardDAO extends DBConnPool {
	public MVCBoardDAO() {
		super();
	}
	
	private String getWhere(Map<String, Object> map, String query) { 
		// 검색 기능
		if (map.get("searchWord") != null) {
			query += " where" + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}
		return query;
	}

	public int selectCount(Map<String, Object> map) { 
		// 게시물 개수 조회
		int totalcount = 0;

		String query = "select count(*) from mvcboard";
		query = getWhere(map, query);

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalcount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalcount;
	}

	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
		// 게시물 목록 조회
		List<MVCBoardDTO> board = new Vector<>();
		
		String query = "select * from mvcboard"
				+ " where title like '%title%'";
		
		query = getWhere(map, query);
		
		query += " order by idx desc limit ?,?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				MVCBoardDTO dto = new MVCBoardDTO();
				// DB에 있는 게시물의 컬럼 값들을 받아와서 DTO에 저장한다.
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8)); // int
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10)); // int 
				
				board.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}

	
}
