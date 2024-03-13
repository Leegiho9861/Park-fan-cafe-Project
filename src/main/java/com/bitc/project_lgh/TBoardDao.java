package com.bitc.project_lgh;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TBoardDao extends JDBConnect{

    public TBoardDao(){
        super();
    }

    public TBoardDao(ServletContext app) {
        super(app);
    }

    public TBoardDao(String dbDriver, String dbUrl, String dbUserId, String dbUserPw) {
        super(dbDriver, dbUrl, dbUserId, dbUserPw);
    }

    //게시물 목록
    //1.전체 목록 가져오기
    public List<TBoardDto> selectList(){
        List<TBoardDto> boardList = new ArrayList<>();

        try{
            String sql = "SELECT num, title, id, postdate, visitcount FROM tb_board ORDER BY num ";
            pstmt =conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                TBoardDto board = new TBoardDto();
                board.setNum(rs.getInt("num"));
                board.setTitle(rs.getString("title"));
                board.setId(rs.getString("id"));
                board.setPostdate(rs.getString("postdate"));
                board.setVisitcount(rs.getInt("visitcount"));

                boardList.add(board);

            }

        }catch (SQLException e){
            System.out.println("데이터 조회 중 오류가 발생했습니다.");
            System.out.println(e.getMessage());
        }


        return boardList;
    }

    //2.검색된 목록 가져오기


    //사용자 이름을 가져오기 위해서 sql문을 가져와야함.
    //게시물 상세
    public TBoardDto selectView(int num){
        TBoardDto board = new TBoardDto();

        try{
            String sql = "SELECT num, title, content, id, postdate, visitcount FROM tb_board WHERE num = ? ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            while(rs.next()){
                board.setNum(rs.getInt("num"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setId(rs.getString("id"));
                board.setPostdate(rs.getString("postdate"));
                board.setVisitcount(rs.getInt("visitcount"));
            }
        }catch (SQLException e){
            System.out.println("데이터 조회 중 오류가 발생했습니다.");
            System.out.println(e.getMessage());
        }
        return board;
    }
    //게시물 등록
    public int insertWrite(TBoardDto board){
        int result = 0;

        try{
            String sql = "INSERT INTO tb_board(title, content, id, postdate) VALUES(?, ?, ?, NOW()) ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getId());
            result = pstmt.executeUpdate();
        }catch (SQLException e){
            System.out.println("데이터 추가 중 오류가 발생했습니다");
            System.out.println("SQLException :" + e.getMessage());
        }
return result;
    }
    //게시물 수정
    public int updateEdit(TBoardDto board){
        int result = 0;
    try{
        String sql = "UPDATE tb_board SET title = ?, content = ? WHERE num = ? ";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "");
        pstmt.setString(2,"");
        pstmt.setInt(3, board.getNum());
        pstmt.executeUpdate();

    }catch (SQLException e){
        System.out.println("데이터 수정 중 오류가 발생했습니다.");
        System.out.println("SQLException :" + e.getMessage());
    }
    return result;
    }
    //게시물 조회수 증가
    public void updateVisitCount(int num){
        try{
            String sql = "UPDATE tb_board SET visitcount = visitcount + 1 WHERE num = ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,num);
            pstmt.executeUpdate();


        }catch (SQLException e){
            System.out.println("데이터 수정 중 오류가 발생했습니다.");
            System.out.println("SQLException: " + e.getMessage());
        }

    }
    //게시물 삭제
    public int deletePost(int num) {
        int result = 0;
        try {
            String sql = "DELETE FROM tb_board WHERE num = ? ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            result =  pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("데이터 삭제 중 오류가 발생했습니다.");
            System.out.println(e.getMessage());
        }

    return result;
    }

}
