package com.jsp.pj1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.jsp.pj1.dto.CDto;
import com.jsp.pj1.dto.Dto;
import com.jsp.pj1.dto.MDto;
import com.jsp.pj1.dto.RDto;

public class Dao {
	
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int PHONE_NONEXISTENT = 0;
	public static final int PHONE_EXISTENT = 1;
	public static final int DISTANCE_NONEXISTENT = 0;
	public static final int DISTANCE_EXISTENT = 1;
	public static final int CDN_NONEXISTENT = 0;
	public static final int CDN_EXISTENT = 1;
	public static final int MEMBER_JOIN_FIAL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	public static final int TABLE_NONEXISTENT =0;
	public static final int TABLE_EXISTENT = 1;
	public static final int BOOKUP_SUCCESS = 1;
	public static final int DELETE_SUCCESS = 1;
	
	
	private Connection getConnection() {
		Context cont = null;
		DataSource dataSource = null;
		Connection conn = null;
		
		try {			
			cont = new InitialContext();
			dataSource = (DataSource) cont.lookup("java:comp/env/jdbc/oracle");
			conn = dataSource.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return conn;
	}
	
	/*
	 * Single tone pattern
	 * 
	 * 서비스클래스 : 호출될 때마다 새로운 서비스 객체를 생성해서 사용
	 * 싱클톤 패턴의 적용 : 매번 동일한 객체를 리턴하므로 같은 객체를 참조하게된다.
	 * 접근제어 수식어 : private이기때문에 외부 클래스에서는 객체를 생성할 수 없게된다.
	 * 유일하게 객체에 접근할 수 있는 getInstance() 정적메소드를 통해서만 DAO에 접근할 수 있게 하였다.
	 */
	private static Dao instance = new Dao();
	
	public Dao() {

	}

	public static Dao getInstance() {	// getInstance�� ������ �� �ֵ��� static �޼ҵ带 ����� ����
		
		return instance;
	}
	
/*	//Cancel book
	public int deleteReservation(String b_seq) {
		System.out.println("DAO측 b_seq : " + b_seq);
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("dao.deleteReservation()");
		
		try {
			conn = getConnection();
			
			String query = "DELETE BOOKUP WHERE b_seq = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b_seq);
			ri = pstmt.executeUpdate();
			System.out.println("deleteReservation ri : " + ri);
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return ri;
		
	}*/
	
	public ArrayList<CDto> schedule(String table, String day, String time) {
		System.out.println(day + " "+ time);
		ArrayList<CDto> CDto = new ArrayList<CDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("dao.schedule()");
		String query = "INSERT INTO calendar VALUES(?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			
				pstmt.setString(1, table);
				pstmt.setString(2, day);
				pstmt.setString(3, time);
				pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return CDto;
	}
	
	public ArrayList<RDto> bookupInfo() {
		
		ArrayList<RDto> bki = new ArrayList<RDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("dao.bookupInfo()");
				
		try {
			conn = getConnection();
			
			String query = "SELECT * FROM bookup";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				Timestamp b_seq = rs.getTimestamp("b_seq");
				String t_index = rs.getString("t_index");
				String email = rs.getString("email");
				String menuname = rs.getString("menuname");
				String withdraw = rs.getString("withdraw");
				String distance = rs.getString("distance");
				String reserved_wmy = rs.getString("reserved_wmy");
				String reserved_day = rs.getString("reserved_day");
				String reserved_Time = rs.getString("reserved_Time");				

				RDto dto = new RDto(b_seq, t_index, email, menuname, withdraw, distance, reserved_wmy, reserved_day, reserved_Time);
				bki.add(dto);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return bki;
		
	}
		
	public ArrayList<RDto> purchaseList() {
		
		ArrayList<RDto> pcl = new ArrayList<RDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("dao.purchaseList()");
				
		try {
			conn = getConnection();
			
			String query = "SELECT * FROM bookup ORDER BY b_seq DESC";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				Timestamp b_seq = rs.getTimestamp("b_seq");
				String t_index = rs.getString("t_index");
				String email = rs.getString("email");
				String menuname = rs.getString("menuname");
				String withdraw = rs.getString("withdraw");
				String distance = rs.getString("distance");
				String reserved_wmy = rs.getString("reserved_wmy");
				String reserved_day = rs.getString("reserved_day");
				String reserved_Time = rs.getString("reserved_Time");				

				RDto dto = new RDto(b_seq, t_index, email, menuname, distance, withdraw, reserved_wmy, reserved_day, reserved_Time);
				pcl.add(dto);				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return pcl;
		
	}
	
	public ArrayList<RDto> clientbookList(String email) {
		System.out.println("DAO email : " + email);
		ArrayList<RDto> pcl = new ArrayList<RDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("dao.clientbookList()");
				
		try {
			conn = getConnection();
			
			String query = "SELECT * FROM bookup WHERE email = ? ORDER BY b_seq DESC";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Timestamp b_seq = rs.getTimestamp("b_seq");
				String t_index = rs.getString("t_index");
				String menuname = rs.getString("menuname");
				String withdraw = rs.getString("withdraw");
				String distance = rs.getString("distance");
				String reserved_wmy = rs.getString("reserved_wmy");
				String reserved_day = rs.getString("reserved_day");
				String reserved_Time = rs.getString("reserved_Time");				

				RDto dto = new RDto(b_seq, t_index, email, menuname, withdraw, distance, reserved_wmy, reserved_day, reserved_Time);
				pcl.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return pcl;
		
	}
	
	/*
	 * 
	 * Try transaction to Payment from Bookup
	 * 
	 * */
	@SuppressWarnings("resource")
	public int bookup(String t_index, String email, String menuname, String withdraw,
					String distance, String reserved_wmy, String reserved_day, 
					String reserved_time, String creditCardFirm, String cdn, 
					String customer_name, String inval, String cvc, String phone,
					String installment, String p_withdraw) {
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String query1 = "INSERT INTO bookup VALUES(sysdate,?,?,?,?,?,?,?,?)";	
		String query2 = "INSERT INTO creditcardcompany VALUES(sysdate, ?, ?,"
						+ " ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			conn.setAutoCommit(false);	//Change autoCommit function manually.
			System.out.println("getConnection");			
			pstmt = conn.prepareStatement(query1);
			System.out.println("prepareStatement for query values");	
			
			pstmt.setString(1, t_index);	
			pstmt.setString(2, email);
			pstmt.setString(3, menuname);
			pstmt.setString(4, withdraw);
			pstmt.setString(5, distance);
			pstmt.setString(6, reserved_wmy);
			pstmt.setString(7, reserved_day);
			pstmt.setString(8, reserved_time);
			
			ri = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(query2);
			
			pstmt.setString(1, creditCardFirm);
			pstmt.setString(2, cdn);
			pstmt.setString(3, customer_name);
			pstmt.setString(4, email);
			pstmt.setString(5, inval);
			pstmt.setString(6, cvc);
			pstmt.setString(7, phone);
			pstmt.setString(8, installment);
			pstmt.setString(9, distance);
			pstmt.setString(10, p_withdraw);
			
			ri += pstmt.executeUpdate();
			System.out.println("ri ::" + ri);
			
			// It can only be commit when all the work is completed without any error.
			if (ri != 2) {
				try {
					conn.rollback();
					conn.setAutoCommit(true);
					
				} catch (SQLException sqle) {
					sqle.printStackTrace();
				}

			}else {
				conn.commit();
			}
						
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
				JdbcUtil.rollback(conn);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
		}
		  
		
		return ri;
	}
	
	
	/*public int paymentCard(String creditCardFirm, String cdn, String customer_name, 
							String email, String inval, String cvc, String phone,
							String installment, String distance, String withdraw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("dao.paymentCard()");
		int ri = 0;
		
		String query = "INSERT INTO creditcardcompany VALUES(sysdate, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, creditCardFirm);
			pstmt.setString(2, cdn);
			pstmt.setString(3, customer_name);
			pstmt.setString(4, email);
			pstmt.setString(5, inval);
			pstmt.setString(6, cvc);
			pstmt.setString(7, phone);
			pstmt.setString(8, installment);
			pstmt.setString(9, distance);
			pstmt.setString(10, withdraw);
			
			ri = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
		
	}*/
	
	public void insertMenu(String menuImg, String menuName, 
							String content, String price) {
		Connection conn = null;
		PreparedStatement pstmt = null;
			System.out.println("dao.menuImg:"+menuImg);
			
		String query = "INSERT INTO product VALUES(p_seq.nextval,?,?,?,?)";	
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, menuImg);
			pstmt.setString(2, menuName);
			pstmt.setString(3, content);
			pstmt.setString(4, price);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}

	public void deleteMenu(String menuName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("dao.insertMenu(menuName) : " + menuName);
		
		String query = "DELETE product WHERE menuname = ?";	
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, menuName);
			
			pstmt.executeUpdate();
	
			} catch (Exception e) {
				e.printStackTrace();
			
			}finally {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
		}
	}
	
	
	public ArrayList<MDto> menuInfo(){
		
		ArrayList<MDto> dtos = new ArrayList<MDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("menuInfo()");
				
		try {
			conn = getConnection();
			
			String query = "SELECT p_seq, menuImg, menuName, menuContent, price "
						 + "FROM product "
						 + "ORDER BY p_seq";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				int seq = rs.getInt("p_seq");
				String menuImg = rs.getString("menuImg");
				String menuName = rs.getString("menuName");
				String content = rs.getString("menuContent");
				String price = rs.getString("price");
				
				MDto dto = new MDto(seq, menuImg, menuName, content, price);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return dtos;
		
	}
	
	public int insertCustomer(Dto dto) {
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "INSERT INTO customer VALUES(m_seq.nextval,?,?,?,?,?,?,sysdate,0)";	
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getFirstName());
			pstmt.setString(2, dto.getLastName());
			pstmt.setString(3, dto.getCustomerEmail());
			pstmt.setString(4, dto.getCustomerPwd());
			pstmt.setString(5, dto.getCustomerPhone());
			pstmt.setString(6, dto.getCustomerAddr());
			pstmt.executeUpdate();

			ri = Dao.MEMBER_JOIN_SUCCESS;	
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return ri;
	}
	
	public int updateDistance(String dist, String email) {
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("dist : " + dist);

		String query = "UPDATE customer "
					+ "SET customer_distance_info= ?"
					+ " WHERE customer_email= ?";	
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dist);
			pstmt.setString(2, email);
			ri = pstmt.executeUpdate();

			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return ri;
	}
	
	

	public int confirmID(String email) {
		
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT customer_email FROM customer WHERE customer_email = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ri = Dao.MEMBER_EXISTENT;
			}else {
				ri = MEMBER_NONEXISTENT;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
		}
		return ri;
	}
	
	public int confirmCdn(String cdn) {
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT credit_cdn FROM bananabank WHERE credit_cdn = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cdn);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ri = Dao.CDN_EXISTENT;
			}else {
				ri = CDN_NONEXISTENT;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return ri;
	}
	
	public int confirmInval(String inval) {
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT credit_inval FROM bananabank WHERE credit_inval = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inval);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ri = Dao.CDN_EXISTENT;
			}else {
				ri = CDN_NONEXISTENT;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return ri;
	}
	
	public int confirmCvc(String cvc) {
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT credit_cvc FROM bananabank WHERE credit_cvc = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cvc);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ri = Dao.CDN_EXISTENT;
			}else {
				ri = CDN_NONEXISTENT;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return ri;
	}

	public Dto confirmPhone(String email) {
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Dto dto = null;
		String query = "SELECT customer_phone FROM customer WHERE customer_email = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new Dto();
				dto.setCustomerPhone((rs.getString("customer_phone")));
				ri = Dao.PHONE_EXISTENT;
			}else {
				ri = PHONE_NONEXISTENT;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return dto;
	}
	
	public Dto confirmDistance(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Dto dto = null;
		String query = "SELECT customer_distance_info FROM customer WHERE customer_email = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new Dto();
				dto.setCustomerDistanceInfo((rs.getString("customer_distance_info")));
				System.out.println(Dao.DISTANCE_EXISTENT); 
			}else {
				System.out.println(DISTANCE_NONEXISTENT); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return dto;
	}
	
	public int existTable(String reserved_Time) {
		System.out.println("디에이오 리저브타임 : " + reserved_Time);
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT reserved_Time FROM bookup WHERE reserved_Time = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reserved_Time);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ri = Dao.TABLE_EXISTENT;
			}else {
				ri = TABLE_NONEXISTENT;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return ri;
	}

	// ȸ������ ����
		public int userCheck(String email, String pw) {	//login.jsp���������� �����ڷκ��� �Էµ� id�� pw�� �Ѱܹ���
			int ri = 0;
			String dbPw;	//DB���� ������ �н�����
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "SELECT customer_pwd FROM customer WHERE customer_email = ?";	//DB���� �н����� ����
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, email); //pstmt : �ش� ���� email�� �������� ='?'�� ���Ե�
				rs = pstmt.executeQuery();	//rs�� �н����� ����

				if(rs.next()) {
					dbPw = rs.getString("customer_pwd");
					// ���ϵ� ri���� �������� ���� : DB�� ����Ǿ� �ִ� dbPw ���� �����ڰ� �Է��� pw�� ���Ͽ� ��ġ���� �ǵ�
					if(dbPw.equals(pw)) {		
						ri = Dao.MEMBER_LOGIN_SUCCESS; //=1
					}else {
						ri = Dao.MEMBER_LOGIN_PW_NO_GOOD; //=0
					}
				}else {
					ri = Dao.MEMBER_LOGIN_IS_NOT; //=-1
					if (!rs.isBeforeFirst() ) {    //resultset ���� ������ ��µ�
					    System.out.println("No data"); 
					} 
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			}
			return ri;
		}
	
	
		//ȸ������ ����	
		public int updateCustomer(Dto dto) {
			int ri = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			String query = "UPDATE customer SET customer_pwd=?, customer_phone=?, customer_addr=? WHERE customer_email= ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, dto.getCustomerPwd());
				pstmt.setString(2, dto.getCustomerPhone());
				pstmt.setString(3, dto.getCustomerAddr());
				pstmt.setString(4, dto.getCustomerEmail());
				ri = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			}
			return ri;
		}
		
		
	//ȸ������ ��������
		public Dto getCustomer(String email) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "SELECT * FROM customer WHERE customer_email = ?";
			Dto dto = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new Dto();
					dto.setFirstName(rs.getString("first_name"));
					dto.setLastName(rs.getString("last_name"));
					dto.setCustomerEmail((rs.getString("customer_email")));
					dto.setCustomerPwd((rs.getString("customer_pwd")));
					dto.setCustomerPhone((rs.getString("customer_phone")));
					dto.setCustomerAddr((rs.getString("customer_addr")));
					dto.setRegJointime((rs.getTimestamp("reg_joinTime")));

				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
					JdbcUtil.close(rs);
					JdbcUtil.close(pstmt);
					JdbcUtil.close(conn);
			}
			
			return dto;
		}
		
		//  Setting Video name
		public String getVideo() {
			String filename = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = getConnection();
				String query = "SELECT * FROM videos WHERE filename LIKE ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%video%");
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					filename = rs.getString("filename");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			}
			System.out.println("getVideo : " + filename);
			
			return filename;
		}
	
		// Table No.1 today ~ sixth all time		public ArrayList<CDto> t1_today_calendar() {
			ArrayList<CDto> ccc = new ArrayList<CDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					
			try {
				conn = getConnection();
				
				String query = "SELECT * FROM calendar "
						+ "WHERE calendar_table='Table No.1' and calendar_day='today' and calendar_time "
						+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.1') "
						+ "ORDER BY calendar_time ASC";
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				System.out.println("calendar() rs : " + rs);
				
				while(rs.next()) {
					String calendar_table = rs.getString("calendar_table");
					String calendar_day = rs.getString("calendar_day");
					String calendar_time = rs.getString("calendar_time");
					
					System.out.println("calendar_day :" + calendar_day);
					
					CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
					ccc.add(cdto);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			}
			return ccc;
			
		}
		public ArrayList<CDto> t1_manana_calendar() {
			ArrayList<CDto> ccc = new ArrayList<CDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					
			try {
				conn = getConnection();
				
				String query = "SELECT * FROM calendar "
						+ "WHERE calendar_table='Table No.1' and calendar_day='manana' and calendar_time "
						+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.1') "
						+ "ORDER BY calendar_time ASC";
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				System.out.println("calendar() rs : " + rs);
				
				while(rs.next()) {
					String calendar_table = rs.getString("calendar_table");
					String calendar_day = rs.getString("calendar_day");
					String calendar_time = rs.getString("calendar_time");
					
					System.out.println("calendar_day :" + calendar_day);
					
					CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
					ccc.add(cdto);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			}
			return ccc;
			
		}
		public ArrayList<CDto> t1_third_calendar() {
			ArrayList<CDto> ccc = new ArrayList<CDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					
			try {
				conn = getConnection();
				
				String query = "SELECT * FROM calendar "
						+ "WHERE calendar_table='Table No.1' and calendar_day='third' and calendar_time "
						+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.1') "
						+ "ORDER BY calendar_time ASC";
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				System.out.println("calendar() rs : " + rs);
				
				while(rs.next()) {
					String calendar_table = rs.getString("calendar_table");
					String calendar_day = rs.getString("calendar_day");
					String calendar_time = rs.getString("calendar_time");
					
					System.out.println("calendar_day :" + calendar_day);
					
					CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
					ccc.add(cdto);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			}
			return ccc;
			
		}
		public ArrayList<CDto> t1_fourth_calendar() {
			ArrayList<CDto> ccc = new ArrayList<CDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					
			try {
				conn = getConnection();
				
				String query = "SELECT * FROM calendar "
						+ "WHERE calendar_table='Table No.1' and calendar_day='fourth' and calendar_time "
						+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.1') "
						+ "ORDER BY calendar_time ASC";
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				System.out.println("calendar() rs : " + rs);
				
				while(rs.next()) {
					String calendar_table = rs.getString("calendar_table");
					String calendar_day = rs.getString("calendar_day");
					String calendar_time = rs.getString("calendar_time");
					
					System.out.println("calendar_day :" + calendar_day);
					
					CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
					ccc.add(cdto);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			}
			return ccc;
			
		}
		public ArrayList<CDto> t1_fifth_calendar() {
			ArrayList<CDto> ccc = new ArrayList<CDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					
			try {
				conn = getConnection();
				
				String query = "SELECT * FROM calendar "
						+ "WHERE calendar_table='Table No.1' and calendar_day='fifth' and calendar_time "
						+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.1') "
						+ "ORDER BY calendar_time ASC";
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				System.out.println("calendar() rs : " + rs);
				
				while(rs.next()) {
					String calendar_table = rs.getString("calendar_table");
					String calendar_day = rs.getString("calendar_day");
					String calendar_time = rs.getString("calendar_time");
					
					System.out.println("calendar_day :" + calendar_day);
					
					CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
					ccc.add(cdto);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			}
			return ccc;
			
		}
		public ArrayList<CDto> t1_sixth_calendar() {
			ArrayList<CDto> ccc = new ArrayList<CDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					
			try {
				conn = getConnection();
				
				String query = "SELECT * FROM calendar "
						+ "WHERE calendar_table='Table No.1' and calendar_day='sixth' and calendar_time "
						+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.1') "
						+ "ORDER BY calendar_time ASC";
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				System.out.println("calendar() rs : " + rs);
				
				while(rs.next()) {
					String calendar_table = rs.getString("calendar_table");
					String calendar_day = rs.getString("calendar_day");
					String calendar_time = rs.getString("calendar_time");
					
					System.out.println("calendar_day :" + calendar_day);
					
					CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
					ccc.add(cdto);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			}
			return ccc;
			
		}
		
		// Table No.2 today ~ sixth all time
				public ArrayList<CDto> t2_today_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.2' and calendar_day='today' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.1') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t2_manana_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.2' and calendar_day='manana' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.2') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t2_third_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.2' and calendar_day='third' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.2') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t2_fourth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.2' and calendar_day='fourth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.2') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t2_fifth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.2' and calendar_day='fifth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.2') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t2_sixth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.2' and calendar_day='sixth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.2') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				
				// Table No.3 today ~ sixth all time
				public ArrayList<CDto> t3_today_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.3' and calendar_day='today' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.3') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t3_manana_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.3' and calendar_day='manana' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.3') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t3_third_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.3' and calendar_day='third' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.3') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t3_fourth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.3' and calendar_day='fourth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.3') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t3_fifth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.3' and calendar_day='fifth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.3') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t3_sixth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.3' and calendar_day='sixth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.3') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				// Table No.4 today ~ sixth all time
				public ArrayList<CDto> t4_today_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.4' and calendar_day='today' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.4') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t4_manana_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.4' and calendar_day='manana' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.4') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t4_third_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.4' and calendar_day='third' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.4') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t4_fourth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.4' and calendar_day='fourth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.4') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t4_fifth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.4' and calendar_day='fifth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.4') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t4_sixth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.4' and calendar_day='sixth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.4') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				// Table No.5 today ~ sixth all time
				public ArrayList<CDto> t5_today_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.5' and calendar_day='today' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.5') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t5_manana_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.5' and calendar_day='manana' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.5') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t5_third_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.5' and calendar_day='third' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.5') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t5_fourth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.5' and calendar_day='fourth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.5') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t5_fifth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.5' and calendar_day='fifth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.5') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t5_sixth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.5' and calendar_day='sixth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.5') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				// Table No.6 today ~ sixth all time
				public ArrayList<CDto> t6_today_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.6' and calendar_day='today' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.6') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t6_manana_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.6' and calendar_day='manana' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.6') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t6_third_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.6' and calendar_day='third' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.6') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t6_fourth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.6' and calendar_day='fourth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.6') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t6_fifth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.6' and calendar_day='fifth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.6') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t6_sixth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.6' and calendar_day='sixth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.6') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				// Table No.7 today ~ sixth all time
				public ArrayList<CDto> t7_today_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.7' and calendar_day='today' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.7') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t7_manana_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.7' and calendar_day='manana' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.7') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t7_third_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.7' and calendar_day='third' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.7') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t7_fourth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.7' and calendar_day='fourth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.7') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t7_fifth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.7' and calendar_day='fifth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.7') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t7_sixth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.7' and calendar_day='sixth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.7') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				// Table No.8 today ~ sixth all time
				public ArrayList<CDto> t8_today_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.8' and calendar_day='today' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.8') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t8_manana_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.8' and calendar_day='manana' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.8') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t8_third_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.8' and calendar_day='third' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.8') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t8_fourth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.8' and calendar_day='fourth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.8') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t8_fifth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.8' and calendar_day='fifth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.8') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t8_sixth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.8' and calendar_day='sixth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.8') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				// Table No.9 today ~ sixth all time
				public ArrayList<CDto> t9_today_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.9' and calendar_day='today' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.9') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t9_manana_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.9' and calendar_day='manana' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.9') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t9_third_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.9' and calendar_day='third' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.9') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t9_fourth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.9' and calendar_day='fourth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.9') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t9_fifth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.9' and calendar_day='fifth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.9') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}
				public ArrayList<CDto> t9_sixth_calendar() {
					ArrayList<CDto> ccc = new ArrayList<CDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
							
					try {
						conn = getConnection();
						
						String query = "SELECT * FROM calendar "
								+ "WHERE calendar_table='Table No.9' and calendar_day='sixth' and calendar_time "
								+ "NOT IN (SELECT DISTINCT reserved_time FROM bookup WHERE t_index='Table No.9') "
								+ "ORDER BY calendar_time ASC";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						System.out.println("calendar() rs : " + rs);
						
						while(rs.next()) {
							String calendar_table = rs.getString("calendar_table");
							String calendar_day = rs.getString("calendar_day");
							String calendar_time = rs.getString("calendar_time");
							
							System.out.println("calendar_day :" + calendar_day);
							
							CDto cdto = new CDto(calendar_table, calendar_day, calendar_time);
							ccc.add(cdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
					return ccc;
					
				}

		
}
