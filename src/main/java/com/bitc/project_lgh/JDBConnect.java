package com.bitc.project_lgh;

import jakarta.servlet.ServletContext;

import java.sql.*;
//데이터 베이스 접속을 위한 부모 클래스
public class JDBConnect {
    public Connection conn;
//    실제 접속 및 SQL 쿼리 실행, 결과값을 받아오기 위한 쿼리
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rs;

//데이터 베이스 접속을 위한 드라이버 정보, 서버 주소, 사용자 ID/PW 정보를 저장하기 위한 필드 선언
    private String dbDriver;
    private String dbUrl;
    private String dbUserId;
    private String dbUserPw;

//    생성자 오버로딩을 통해서 여러가지 방식으로 데이터 베이스를 사용할 수 있더록 선언
//    기본 값으로 사용 시(MySql을 기본으로 사용)
    public JDBConnect(){
        this(
          "com.mysql.cj.jdbc.Driver","jdbc:mysql://localhost:3306/testdb?","TEST1","root"
        );
    }

//Web.xml
    public JDBConnect(ServletContext app){
        this(
                app.getInitParameter("MysqlDriver"),
                app.getInitParameter("MysqlUrl"),
                app.getInitParameter("MysqlUserId"),
                app.getInitParameter("MysqlUserPw")
        );
    }
//사용자가 전달한 드라이버 정보, 서버 주소, 사용자 ID/PW를 사용
    public JDBConnect(String dbDriver, String dbUrl, String dbUserId, String dbUserPw){
        this.dbDriver = dbDriver;
        this.dbUrl = dbUrl;
        this.dbUserId = dbUserId;
        this.dbUserPw = dbUserPw;
    }


// 저장된 드라이버 정보, 서버 주소, 사용자 ID/PW를 사용하여 데이터 베이스 접속
    public void dbOpen(){
        try{
            Class.forName(dbDriver);
            conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
            System.out.println("DB연결에 성공했습니다.");
        }catch (Exception e){
            System.out.println("데이터베이스 연결이 실패했습니다.");
        }
    }
//데이터 베이스 접속 경로 및 리소스 해제
    public void dbClose(){
        try{
            if(rs != null){rs.close();}
            if(stmt != null){stmt.close();}
            if(pstmt != null){pstmt.close();}
            if(conn != null){conn.close();}
        }catch (Exception e){
            System.out.println("DB연결 리소스 및 해제 중 오류 발생");
        }
    }
}
