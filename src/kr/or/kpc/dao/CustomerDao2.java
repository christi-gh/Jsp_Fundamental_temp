package kr.or.kpc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.kpc.dto.CustomerDto2;
import kr.or.kpc.util.ConnLocator;

public class CustomerDao2 {
	public static CustomerDao2 dao;
	private CustomerDao2() {

	}
	public static CustomerDao2 getInstance() {
		if(dao==null) {
			dao= new CustomerDao2();
		}
		return dao;
	}
	
	public CustomerDto2 getLogin(String email, String pwd) {
		CustomerDto2 dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ConnLocator.getConnect();

			StringBuffer sql = new StringBuffer();
			sql.append("SELECT c_email, c_pwd, c_name ");
			sql.append("FROM customer ");
			sql.append("WHERE c_email = ? AND c_pwd = PASSWORD(?) ");

			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			pstmt.setString(++index, email);
			pstmt.setString(++index, pwd);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				index = 0;
				String _email = rs.getString(++index);
				String _pwd = rs.getString(++index);
				String name = rs.getString(++index);

				dto = new CustomerDto2(_email, _pwd, name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public int insert(CustomerDto2 dto) {
			int resultCount = 0;

			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ConnLocator.getConnect();

				StringBuffer sql = new StringBuffer();
				sql.append("INSERT INTO customer(c_email,c_pwd,c_name) ");
				sql.append("VALUES(?,PASSWORD(?),?); ");

				pstmt = con.prepareStatement(sql.toString());
				int index = 0;
				pstmt.setString(++index, dto.getEmail());
				pstmt.setString(++index, dto.getPwd());
				pstmt.setString(++index, dto.getName());
				

				resultCount = pstmt.executeUpdate();

			} catch (SQLException e1) {
				e1.printStackTrace();
			} finally {
				close(con, pstmt);
			}

			return resultCount;
		}

		private void close(Connection con, PreparedStatement pstmt) {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		public int update(CustomerDto2 dto) {
			int resultCount = 0;

			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ConnLocator.getConnect();

				StringBuffer sql = new StringBuffer();
				sql.append("UPDATE customer ");
				sql.append("SET c_pwd = PASSWORD(?), c_name=? ");
				sql.append("WHERE c_email = ?; ");

				pstmt = con.prepareStatement(sql.toString());
				int index = 0;
				pstmt.setString(++index, dto.getPwd());
				pstmt.setString(++index, dto.getName());
				pstmt.setString(++index, dto.getEmail());

				resultCount = pstmt.executeUpdate();

			} catch (SQLException e1) {
				e1.printStackTrace();
			} finally {
				close(con, pstmt);
			}
			return resultCount;
		}

		public boolean isExisted(String email) {
			boolean success = false;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = ConnLocator.getConnect();
				
				StringBuffer sql = new StringBuffer();
				sql.append("SELECT c_email ");
				sql.append("FROM customer ");
				sql.append("WHERE c_email = ? ");
				
				pstmt = con.prepareStatement(sql.toString());
				int index = 0;
				pstmt.setString(++index, email);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					success = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)rs.close();
					if (pstmt != null)
						pstmt.close();
					if (con != null)
						con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return success;
		}
			public CustomerDto2 select(String email) {
				CustomerDto2 dto = null;

				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {
					con = ConnLocator.getConnect();

					StringBuffer sql = new StringBuffer();
					sql.append("SELECT c_email, c_name ");
					sql.append("FROM customer ");
					sql.append("WHERE c_email = ? ");

					pstmt = con.prepareStatement(sql.toString());
					int index = 0;
					pstmt.setString(++index, email);

					rs = pstmt.executeQuery();

					if (rs.next()) {
						index = 0;
						String _email = rs.getString(++index);
						String name = rs.getString(++index);

						dto = new CustomerDto2(_email, null, name);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (con != null)
							con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				return dto;
			}
		
	}
