package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;
		private PreparedStatement pstmt; /*�̰� �ּ����� 5/18�� */
	private ResultSet rs;

	public BbsDAO() {
		try {
			String dbURL= "jdbc:mysql://localhost:3306/WEB"; //?autoReconnect=true&useSSL=false
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public String getDate() {
		String SQL = "SELECT NOW()"; // ���� �ð� ��������
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql�� ���� �ϰ� �ϴ°�
			rs = pstmt.executeQuery(); //���� ����
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public int getNext() {
		//�Խñ� ��ü�� ���� ���鼭 �ϳ��� �þ� ����.
		String SQL = "SELECT idx FROM borad order by idx desc"; // ��ñ� ��������
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql�� ���� �ϰ� �ϴ°�
			rs = pstmt.executeQuery(); //���� ����
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //���� �Խñ��� ������ 1�� ��ȯ
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	public int write(String boradTitle, String userID, String boradContent) {
		//�Խñ� �ۼ� �ϰ� �ϴ� �Ѵ�.
		String SQL = "INSERT INTO borad VALUES (?,?,?,?,?,?)"; // ��ñ� ��������
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql�� ���� �ϰ� �ϴ°�
			pstmt.setInt(1, getNext()); //�ϴϾ� �� �߰� �ϱ� ù��° �� �������� ��������
			pstmt.setString(2, boradTitle); //�ϴϾ� �� �߰� �ϱ� 
			pstmt.setString(3, userID); //�ϴϾ� �� �߰� �ϱ� 
			pstmt.setString(4, getDate()); //�ϴϾ� �� �߰� �ϱ�
			pstmt.setString(5, boradContent); //�ϴϾ� �� �߰� �ϱ� 
			pstmt.setInt(6, 1); //�ϴϾ� �� �߰� �ϱ�
			System.out.println(boradContent);

			return pstmt.executeUpdate(); //�����ϸ� 0�� ��ȯ
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}	
	public ArrayList<Bbs> getList(int pageNumber){ //10���� �Խñ� ��������
		//�Խñ� ��ü�� ���� ���鼭 �ϳ��� �þ� ����.
		//boradAvailable �� 1 �̻��̸� ���� ���� IDX�� �������� �ϸ� 10������ �����´�
		String SQL = "SELECT * FROM borad where idx < ? AND boradAvailable = 1 ORDER BY idx DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>(); //������Ѿߵ�
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql�� ���� �ϰ� �ϴ°�
			pstmt.setInt(1, getNext() - (pageNumber - 1) *10); //�Խñ� 5�̸� 6 ���� 1�������� 6���� ������ ����
			rs = pstmt.executeQuery(); //���� ����
			while(rs.next()) { // ��� ����� ����
				Bbs bbs = new Bbs();
				bbs.setIdx(rs.getInt(1));
				bbs.setBoradTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBoradDate(rs.getString(4));
				bbs.setBoradContent(rs.getString(5));
				bbs.setBoradAvailable(rs.getString(6));

				list.add(bbs); // ������ list�� ���� ��Ű��

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ����Ʈ ��� ��Ű��;
	}

	public boolean nextPage(int pageNumber) { //10 �̻��̸� ���� ������ ó��
		//�Խñ� ��ü�� ���� ���鼭 �ϳ��� �þ� ����.
		//boradAvailable �� 1 �̻��̸� ���� ���� IDX�� �������� �ϸ� 10������ �����´�
		String SQL = "SELECT idx FROM borad where idx < ? and boradAvailable = 1";
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql�� ���� �ϰ� �ϴ°�
			pstmt.setInt(1, getNext() - (pageNumber - 1) *10); //�Խñ� 5�̸� 6 ���� 1�������� 6���� ������ ����
			rs = pstmt.executeQuery(); //���� ����
			while(rs.next()) { // ��� ����� ����
				return true; //���������� �Ѿ
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; // ����Ʈ ��� ��Ű��;
	}

	public Bbs getBbs(int idx) {
		String SQL = "SELECT * FROM borad WHERE idx = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setIdx(rs.getInt(1));
				bbs.setBoradTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBoradDate(rs.getString(4));
				bbs.setBoradContent(rs.getString(5));
				bbs.setBoradAvailable(rs.getString(6));
				return bbs;
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int idx, String boradTitle, String boradContent) { //���� ������
		//�Խñ� �ۼ� �ϰ� �ϴ� �Ѵ�.
		String SQL = "UPDATE borad SET boradTitle= ? , boradContent = ? WHERE idx = ? "; // ��ñ� ��������
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql�� ���� �ϰ� �ϴ°�
			pstmt.setString(1, boradTitle); //�ϴϾ� �� �߰� �ϱ� ù��° �� �������� ��������
			pstmt.setString(2, boradContent); //�ϴϾ� �� �߰� �ϱ� 
			pstmt.setInt(3, idx); //�ϴϾ� �� �߰� �ϱ�

			return pstmt.executeUpdate(); //�����ϸ� 0�� ��ȯ
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
}
