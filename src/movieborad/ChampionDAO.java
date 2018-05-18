package movieborad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ChampionDAO {
	private Connection conn;
	private PreparedStatement pstmt; /*�̰� �ּ����� 5/18�� */
	private ResultSet rs;

	public ChampionDAO() {
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
		String SQL = "SELECT idx FROM champion order by idx desc"; // �������� ������ �� ����
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
	public int write(String userID, String championContent) {
		//�Խñ� �ۼ� �ϰ� �ϴ� �Ѵ�.
		String SQL = "INSERT INTO champion VALUES (?,?,?,?)"; // ��ñ� ��������
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql�� ���� �ϰ� �ϴ°�
			pstmt.setInt(1, getNext()); //�ϴϾ� �� �߰� �ϱ� ù��° �� �������� ��������
			pstmt.setString(2, userID); //�ϴϾ� �� �߰� �ϱ� 
			pstmt.setString(3, getDate()); //�ϴϾ� �� �߰� �ϱ�
			pstmt.setString(4, championContent); //�ϴϾ� �� �߰� �ϱ� 
			System.out.println(championContent);

			return pstmt.executeUpdate(); //�����ϸ� 0 �̻� ��ȯ
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	public ArrayList<Champion> getList(int pageNumber){ //10���� �Խñ� ��������
		//�Խñ� ��ü�� ���� ���鼭 �ϳ��� �þ� ����.
		//boradAvailable �� 1 �̻��̸� ���� ���� IDX�� �������� �ϸ� 10������ �����´�
		String SQL = "SELECT * FROM champion where idx < ? ORDER BY idx DESC LIMIT 10";
		ArrayList<Champion> list = new ArrayList<Champion>(); //������Ѿߵ�
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql�� ���� �ϰ� �ϴ°�
			pstmt.setInt(1, getNext() - (pageNumber - 1) *10); //�Խñ� 5�̸� 6 ���� 1�������� 6���� ������ ����
			rs = pstmt.executeQuery(); //���� ����
			while(rs.next()) { // ��� ����� ����
				Champion champion = new Champion();
				champion.setIdx(rs.getString(1));
				champion.setUserID(rs.getString(2));
				champion.setChampionDate(rs.getString(3));
				champion.setChampionContent(rs.getString(4));				

				list.add(champion); // ������ list�� ���� ��Ű��

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ����Ʈ ��� ��Ű��;
	}
	public boolean nextPage(int pageNumber) { //10 �̻��̸� ���� ������ ó��
		//�Խñ� ��ü�� ���� ���鼭 �ϳ��� �þ� ����.
		//boradAvailable �� 1 �̻��̸� ���� ���� IDX�� �������� �ϸ� 10������ �����´�
		String SQL = "SELECT idx FROM champion where idx < ?";
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
}