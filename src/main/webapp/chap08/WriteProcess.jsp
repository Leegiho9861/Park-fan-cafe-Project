<%@ page import="com.bitc.project_lgh.database.TBoardDao" %>
<%@ page import="com.bitc.project_lgh.database.TBoardDto" %>
<%@ page import="com.bitc.project_lgh.utils.JSFunction" %><%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-06
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%--로그인 상태에서만 글쓰기를 할 수 있으므로 로그인 상태 체크를 위한 LoginCheck 파일 불러오기--%>
<jsp:include page="login/LoginCheck.jsp"></jsp:include>

<%
    //현재 로그인 부분 구현이 안 되었으므로 주석처리
//    if (session.getAttribute("userId") == null) {
//        out.print("<script>");
//        out.print("alert('로그인 후 이용해 주세요.');");
//        out.print("location.href = './LoginForm.jsp';");
//        out.print("</script>");
//    }

//    파라미터값 가져오기
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    TBoardDto board = new TBoardDto();
    board.setTitle(title);
    board.setContent(content);
//    세션에서 사용자 ID를 가져옴
    board.setId(session.getAttribute("userId").toString());
//    board.setId("test1"); // 현재 로그인 화면 및 로그인 프로세스가 없으므로 더미 데이터로 'test1'을 입력해 줌

//    글 등록을 위해서 BoardDao 타입의 객체 생성 및 데이터 베이스 연결
    TBoardDao dao = new TBoardDao();
    dao.dbOpen();
//    데이터 베이스에 글 등록
    int result = dao.insertWrite(board);
    dao.dbClose();

//    정상적으로 글 등록 완료 여부 확인
    if (result == 1) {
//        글 등록 시 목록 페이지로 이동
        response.sendRedirect("./List.jsp");
    }
    else {
//        오류 시 이전 페이지로 이동
        JSFunction.alertBack("글쓰기 중 오류가 발생했습니다", out);
//        out.print("<script>");
//        out.print("alert('글쓰기 중 오류가 발생했습니다.');");
//        out.print("history.back();");
//        out.print("</script>");
    }
%>