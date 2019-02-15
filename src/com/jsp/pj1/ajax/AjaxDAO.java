package com.jsp.pj1.ajax;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.jsp.pj1.dao.JdbcUtil;

public class AjaxDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public AjaxDAO() {
		
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbID = "exorsa";
			String dbPW = "m1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	public ArrayList<PGHistoyDto> search(String keyword) {	
	
		String query = "SELECT * FROM creditcardcompany "
				+ "WHERE payment_date||creditcardfirm||cdn||"
				+ "customer_name||email||phone||withdraw LIKE ? "
				+ "ORDER BY payment_date DESC";
				// could not search for payment_date by wild card , which is type of the Timestamp.
		
		ArrayList<PGHistoyDto> userList = new ArrayList<PGHistoyDto>();
		
		try {
			pstmt = conn.prepareStatement(query);
			//Wild card :?äπ?†ï?ïú ?öî?ÜåÍ∞? ?è¨?ï®?êú Î™®Îì† ?öî?ÜåÍ∞? Ï∂úÎ†•
			pstmt.setString(1, "%" + keyword + "%"); 
			rs = pstmt.executeQuery();
			System.out.println(rs);
			
			while (rs.next()) {
				PGHistoyDto dto = new PGHistoyDto();
				dto.setPaymentDate(rs.getTimestamp("payment_date"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setWithdraw(rs.getString("withdraw"));
				dto.setCard(rs.getString("creditcardfirm"));
				dto.setCdn(rs.getString("cdn"));
				dto.setName(rs.getString("customer_name"));
				dto.setIntallment(rs.getString("installment"));
				
				userList.add(dto);
				System.out.println("DAO LIST : " + userList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userList;
		
	}
	
	public ArrayList<URDto> cancel(String bseq) {
		System.out.println("cancel()");System.out.println("bseq : " + bseq);
		String query = "DELETE bookup WHERE b_seq = TO_DATE(?, 'yymmddhh24miss')";
		ArrayList<URDto> userList = new ArrayList<URDto>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bseq); //Wild card : ?äπ?†ï?ïú ?öî?ÜåÍ∞? ?è¨?ï®?êú Î™®Îì† ?öî?ÜåÍ∞? Ï∂úÎ†•
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			System.out.println(rs);
			
			while (rs.next()) {
				System.out.println("whileÎ¨? ÏßÑÏûÖ");
				URDto dto = new URDto();
				dto.setB_seq(rs.getTimestamp(1));
				dto.setT_index(rs.getString(2));
				dto.setEmail(rs.getString(3));
				dto.setMenuname(rs.getString(4));
				dto.setDistance(rs.getString(5));
				dto.setReserved_wmy(rs.getString(6));
				dto.setReserved_day(rs.getString(7));
				dto.setReserved_Time(rs.getString(8));
				
				userList.add(dto);
				System.out.println("DAO LIST : " + userList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userList;
		
	}
	
	public void deleteMenu(String menuName) {
		System.out.println("AjaxDao.insertMenu(menuName) : " + menuName);
		
		String query = "delete product where menuname = ?";	
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, menuName);
			
			pstmt.executeUpdate();
	
			} catch (Exception e) {
				e.printStackTrace();
			
			}finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
		}
	}

	public void deleteToday(String table, String time, String day) {
		System.out.println("AjaxDao.deleteToday(table) : " + table);
		
		String query = "delete calendar where calendar_table = ? and calendar_time = ? and calendar_day= ?";	
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, table);
			pstmt.setString(2, time);
			pstmt.setString(3, day);
			
			pstmt.executeUpdate();
	
			} catch (Exception e) {
				e.printStackTrace();
			
			}finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
		}
	}

	public void insertVideo(String filename) {
		System.out.println("AjaxDao.insertVideo(filename): " + filename);
		
		String query = "INSERT INTO videos VALUES(vid_seq.nextval, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, filename);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
	}
	
	
	
}
