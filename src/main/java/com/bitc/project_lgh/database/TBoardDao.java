package com.bitc.project_lgh.database;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// 데이터 베이스 접속을 위한 JDBConnect 클래스를 상속받고 게시판 정보를 제어하기 위한 클래스
public class TBoardDao extends JDBConnect {
    public TBoardDao() {
        super();
    }

    public TBoardDao(ServletContext app) {
        super(app);
    }

    public TBoardDao(String dbDriver, String dbUrl, String dbUserId, String dbUserPw) {
        super(dbDriver, dbUrl, dbUserId, dbUserPw);
    }

//    게시물 목록을 가져오기 위한 메소드
//    1단계 전체 목록 가져오기
//    2단계 검색된 목록 가져오기
//    public List<TBoardDto> selectList() {
//        List<TBoardDto> boardList = new ArrayList<>();
//
//        try { //여기에
//            String sql = "select num, title, id, postdate, visitcount from tb_board order by num desc ";
//
//            pstmt = conn.prepareStatement(sql);
//
//            rs = pstmt.executeQuery();
//
//            while (rs.next()) {
//                TBoardDto board = new TBoardDto();
//                board.setNum(rs.getInt("num"));
//                board.setTitle(rs.getString("title"));
//                board.setId(rs.getString("id"));
//                board.setPostdate(rs.getString("postdate"));
//                board.setVisitcount(rs.getInt("visitcount"));
//
//                boardList.add(board);
//            }
//        }
//        catch (SQLException e) {
//            System.out.println("데이터 조회 중 오류가 발생했습니다.");
//            System.out.println("SQLException : " + e.getMessage());
//        }
//
//        return boardList;
//    }

    //  전체 게시물 목록 가져오기 (페이징 기능 추가)
    public List<TBoardDto> selectTBoardListPaging(int startNum, int postSize) {
        List<TBoardDto> boardList = new ArrayList<>();

        try {
            String sql = "SELECT num, title, id, postdate, visitcount ";
            sql += "FROM tb_board ";
            sql += "ORDER BY num DESC ";
            sql += "LIMIT ?, ? "; // LIMIT를 사용하여 지정한 index부터 지정한 수만큼 데이터를 조회하여 가져옴

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startNum); // 데이터를 가져오기 시작할 index, index는 0부터 시작
            pstmt.setInt(2, postSize); // 가져올 데이터 수 지정

            rs = pstmt.executeQuery();

            while (rs.next()) {
                TBoardDto board = new TBoardDto();

                board.setNum(rs.getInt("num"));
                board.setTitle(rs.getString("title"));
                board.setId(rs.getString("id"));
                board.setPostdate(rs.getString("postdate"));
                board.setVisitcount(rs.getInt("visitcount"));

                boardList.add(board);
            }
        } catch (SQLException e) {
            System.out.println("수정 중 오류가 발생했습니다.");
            System.out.println("SQLException : " + e.getMessage());
        }

        return boardList;
    }

    //    게시물 상세정보를 가져오기 위한 메소드
//    1단계 사용자 이름 없이 가져오기
//    2단계 사용자 이름도 함께 가져오기, 사용자 이름을 가져오기 위해서 SQL문을 join해야 함
    public TBoardDto selectView(int num) {
        TBoardDto board = new TBoardDto();

        try {
//            1단계 select 문
            String sql = "select num, title, content, id, postdate, visitcount from tb_board where num = ? ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                board.setNum(rs.getInt("num"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setId(rs.getString("id"));
                board.setPostdate(rs.getString("postdate"));
                board.setVisitcount(rs.getInt("visitcount"));
            }
        } catch (SQLException e) {
            System.out.println("데이터 조회 중 오류가 발생했습니다.");
            System.out.println("SQLException : " + e.getMessage());
        }

        return board;
    }

    //    게시물 등록을 위한 메소드
    public int insertWrite(TBoardDto board) {
        int result = 0;

        try {
            String sql = "insert into tb_board(title, content, id, postdate) ";
            sql += "values(?, ?, ?, now()) ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getId());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("데이터 추가 중 오류가 발생했습니다.");
            System.out.println("SQLException : " + e.getMessage());
        }

        return result;
    }

    //    게시물 수정을 위한 메소드
    public int updateEdit(TBoardDto board) {
        int result = 0;

        try {
            String sql = "update tb_board set title = ?, content = ? where num = ? ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getNum());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("데이터 수정 중 오류가 발생했습니다.");
            System.out.println("SQLException : " + e.getMessage());
        }

        return result;
    }

    //    게시물 조회수 증가를 위한 메소드
    public void updateVisitCount(int num) {
        try {
            String sql = "update tb_board set visitcount = visitcount + 1 where num = ? ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("데이터 수정 중 오류가 발생했습니다.");
            System.out.println("SQLException : " + e.getMessage());
        }

    }

//    게시물 삭제를 위한 메소드

    public int deletePost(int num) {
        int result = 0;

        try {
            String sql = "delete from tb_board where num = ? ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("데이터 삭제 중 오류가 발생했습니다.");
            System.out.println("SQLException : " + e.getMessage());
        }

        return result;
    }

    //  전체 게시물 수 가져오기
    public int totalCount() {
        int result = 0;

        try {
            String sql = "SELECT COUNT(*) AS cnt FROM tb_board ";

            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                result = rs.getInt("cnt");
            }
        } catch (SQLException e) {
            System.out.println("데이터 조회 중 오류가 발생했습니다.");
            System.out.println("SQLException : " + e.getMessage());
        }

        return result;

    }
}
