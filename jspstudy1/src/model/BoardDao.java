package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	public int maxnum() {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select ifnull(max(num),0) from board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	public boolean insert(Board b) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into board" + "(num, name, pass, subject, content, file1, regdate, readcnt, grp, grplevel, grpstep)" + "value(?, ?, ?, ?, ?, ?, now(), 0, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getNum());
			pstmt.setString(2, b.getName());
			pstmt.setString(3, b.getPass());
			pstmt.setString(4, b.getSubject());
			pstmt.setString(5, b.getContent());
			pstmt.setString(6, b.getFile1());
			pstmt.setInt(7, b.getGrp());
			pstmt.setInt(8, b.getGrplevel());
			pstmt.setInt(9,  b.getGrpstep());
			pstmt.executeUpdate();
			return true;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, null);
		}
		return false;
	}
	public int boardCount() {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			if(rs.next()) return rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	public List<Board> list(int pageNum,int limit){
	      Connection conn = DbConnection.getConnection();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<Board> list = new ArrayList<Board>();
	      String sql="select * from board order by grp desc, grpstep asc limit ?,?"; //?번째부터 ?건을 가져와라
	      try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setInt(1, (pageNum-1)*limit); //0이면 첫번째 레코드
	         pstmt.setInt(2, limit);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            Board b = new Board();
	            b.setNum(rs.getInt("num"));
	            b.setName(rs.getString("name"));
	            b.setPass(rs.getString("pass"));
	            b.setSubject(rs.getString("subject"));
	            b.setContent(rs.getString("content"));
	            b.setFile1(rs.getString("file1"));
	            b.setGrp(rs.getInt("grp"));
	            b.setGrplevel(rs.getInt("grplevel"));
	            b.setGrpstep(rs.getInt("grpstep"));
	            b.setReadcnt(rs.getInt("readcnt"));
	            b.setRegdate(rs.getTimestamp("regdate"));
	            list.add(b);   //추가된 순서를 유지함 -> index 로 찾을 수 있음
	         }
	         return list;
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         DbConnection.close(conn, pstmt, null);
	      }
	      return null;
	   }
	public Board selectOne(int num) {
		Connection conn = DbConnection.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "select * from board where num=?";
	    try {
	    	pstmt=conn.prepareStatement(sql);
	    	pstmt.setInt(1, num);
	    	rs = pstmt.executeQuery();
	    	if(rs.next()) {
	    		Board b = new Board();
	    		b.setNum(rs.getInt("num"));
	            b.setName(rs.getString("name"));
	            b.setPass(rs.getString("pass"));
	            b.setSubject(rs.getString("subject"));
	            b.setContent(rs.getString("content"));
	            b.setFile1(rs.getString("file1"));
	            b.setGrp(rs.getInt("grp"));
	            b.setGrplevel(rs.getInt("grplevel"));
	            b.setGrpstep(rs.getInt("grpstep"));
	            b.setReadcnt(rs.getInt("readcnt"));
	            b.setRegdate(rs.getTimestamp("regdate"));
	            return b;
	    	}
	    }catch(SQLException e) {
	    	e.printStackTrace();
	    }finally {
	    	DbConnection.close(conn, pstmt, rs);
	    }
	    return null;
	}
	public void readcntAdd(int num) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set readcnt = readcnt+1 where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
	    	pstmt.setInt(1, num);
	    	pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, null);
		}
	   
	}
	public void grpStepAdd(int grp, int grpstep) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set grpstep = grpstep + 1 where grp=? and grpstep>?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, grp);
			pstmt.setInt(2, grpstep);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, null);
		}
	}
	public boolean update(Board b) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set name=?, subject=?, content=?, file1=? where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getName());
			pstmt.setString(2, b.getSubject());
			pstmt.setString(3, b.getContent());
			pstmt.setString(4, b.getFile1());
			pstmt.setInt(5, b.getNum());
			pstmt.executeUpdate();
			return true;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, null);
		}
		return false;
	}
	public boolean delete(int num) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from board where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			return true;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, null);
		}
		return false;
		
	}
}
