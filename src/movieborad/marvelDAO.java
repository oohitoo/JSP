package movieborad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class marvelDAO {
	private Connection conn;
		private PreparedStatement pstmt; /*이거 주석햇음 5/18일 */
	private ResultSet rs;

	public marvelDAO() {
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
		String SQL = "SELECT NOW()"; // 서버 시간 가져오기
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql문 시작 하게 하는것
			rs = pstmt.executeQuery(); //쿼리 전송
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public int getNext() {
		//게시글 전체를 가져 오면서 하나씩 늘어 난다.
		String SQL = "SELECT idx FROM marvel order by idx desc"; // 계시글 가져오기
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql문 시작 하게 하는것
			rs = pstmt.executeQuery(); //쿼리 전송
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //현재 게시글이 없으면 1로 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int write(String userID, String marvelContent) {
		//게시글 작성 하게 하는 한다.
		String SQL = "INSERT INTO marvel VALUES (?,?,?,?)"; // 계시글 가져오기
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql문 시작 하게 하는것
			pstmt.setInt(1, getNext()); //하니씩 값 추가 하기 첫번째 글 다음으로 측정도함
			pstmt.setString(2, userID); //하니씩 값 추가 하기 
			pstmt.setString(3, getDate()); //하니씩 값 추가 하기
			pstmt.setString(4, marvelContent);
			System.out.println(marvelContent);

			return pstmt.executeUpdate(); //성공하면 0을 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}	
	public ArrayList<marvel> getList(int pageNumber){ //10개의 게시글 가져오기
		//게시글 전체를 가져 오면서 하나씩 늘어 난다.
		//boradAvailable 가 1 이상이면 가져 오며 IDX로 내림차순 하며 10개까지 가져온다
		String SQL = "SELECT * FROM marvel where idx < ? ORDER BY idx DESC LIMIT 10";
		ArrayList<marvel> list = new ArrayList<marvel>(); //저장시켜야됨
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql문 시작 하게 하는것
			pstmt.setInt(1, getNext() - (pageNumber - 1) *10); //게시글 5이면 6 나옴 1페이지임 6보다 작으면 나옴
			rs = pstmt.executeQuery(); //쿼리 전송
			while(rs.next()) { // 모두 결과값 저장
				marvel marvel = new marvel();
				marvel.setIdx(rs.getInt(1));
				marvel.setUserID(rs.getString(2));
				marvel.setMarvelDate(rs.getString(3));
				marvel.setMarvelContent(rs.getString(4));

				list.add(marvel); // 뽑은걸 list에 저장 시키기

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // 리스트 출력 시키기;
	}

	public boolean nextPage(int pageNumber) { //10 이상이면 다음 페이지 처리
		//게시글 전체를 가져 오면서 하나씩 늘어 난다.
		//boradAvailable 가 1 이상이면 가져 오며 IDX로 내림차순 하며 10개까지 가져온다
		String SQL = "SELECT idx FROM marvel where idx < ?";
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql문 시작 하게 하는것
			pstmt.setInt(1, getNext() - (pageNumber - 1) *10); //게시글 5이면 6 나옴 1페이지임 6보다 작으면 나옴
			rs = pstmt.executeQuery(); //쿼리 전송
			while(rs.next()) { // 모두 결과값 저장
				return true; //다음페이지 넘어감
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; // 리스트 출력 시키기;
	}
}
