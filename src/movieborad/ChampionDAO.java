package movieborad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ChampionDAO {
	private Connection conn;
	private PreparedStatement pstmt; /*이거 주석햇음 5/18일 */
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
		String SQL = "SELECT idx FROM champion order by idx desc"; // 마지막에 쓴글이 젤 위로
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
	public int write(String userID, String championContent) {
		//게시글 작성 하게 하는 한다.
		String SQL = "INSERT INTO champion VALUES (?,?,?,?)"; // 계시글 가져오기
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql문 시작 하게 하는것
			pstmt.setInt(1, getNext()); //하니씩 값 추가 하기 첫번째 글 다음으로 측정도함
			pstmt.setString(2, userID); //하니씩 값 추가 하기 
			pstmt.setString(3, getDate()); //하니씩 값 추가 하기
			pstmt.setString(4, championContent); //하니씩 값 추가 하기 
			System.out.println(championContent);

			return pstmt.executeUpdate(); //성공하면 0 이상 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public ArrayList<Champion> getList(int pageNumber){ //10개의 게시글 가져오기
		//게시글 전체를 가져 오면서 하나씩 늘어 난다.
		//boradAvailable 가 1 이상이면 가져 오며 IDX로 내림차순 하며 10개까지 가져온다
		String SQL = "SELECT * FROM champion where idx < ? ORDER BY idx DESC LIMIT 10";
		ArrayList<Champion> list = new ArrayList<Champion>(); //저장시켜야됨
		try {	
			PreparedStatement pstmt = conn.prepareStatement(SQL); // sql문 시작 하게 하는것
			pstmt.setInt(1, getNext() - (pageNumber - 1) *10); //게시글 5이면 6 나옴 1페이지임 6보다 작으면 나옴
			rs = pstmt.executeQuery(); //쿼리 전송
			while(rs.next()) { // 모두 결과값 저장
				Champion champion = new Champion();
				champion.setIdx(rs.getString(1));
				champion.setUserID(rs.getString(2));
				champion.setChampionDate(rs.getString(3));
				champion.setChampionContent(rs.getString(4));				

				list.add(champion); // 뽑은걸 list에 저장 시키기

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // 리스트 출력 시키기;
	}
	public boolean nextPage(int pageNumber) { //10 이상이면 다음 페이지 처리
		//게시글 전체를 가져 오면서 하나씩 늘어 난다.
		//boradAvailable 가 1 이상이면 가져 오며 IDX로 내림차순 하며 10개까지 가져온다
		String SQL = "SELECT idx FROM champion where idx < ?";
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