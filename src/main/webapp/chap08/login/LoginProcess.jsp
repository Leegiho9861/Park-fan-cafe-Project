<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-07
  Time: 오전 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%--사용자 정보를 제어하기 위한 클래스 import--%>
<%@ page import="com.bitc.project_lgh.database.TBUserDao" %>
<%@ page import="com.bitc.project_lgh.database.TBUserDto" %>
<%@ page import="com.bitc.project_lgh.utils.JSFunction" %>

<%
    request.setCharacterEncoding("UTF-8");

//    로그인을 위한 정보 가져오기
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    TBUserDao dao = new TBUserDao(application);
    dao.dbOpen();

//    사용자가 입력한 id/pw와 일치하는 데이터가 있는지 확인
    boolean isMember = dao.isMember(id, pwd);

    if (isMember) {
//        사용자가 입력한 id/pw가 일치하는 데이터가 있을 경우 해당하는 id의 상세정보를 가져옴
        TBUserDto member = dao.selectMember(id);
        dao.dbClose();

//        가져온 상세 정보를 세션에 저장
        session.setAttribute("userId", member.getId());
        session.setAttribute("userName", member.getName());
//        세션 유지시간 설정
        session.setMaxInactiveInterval(60 * 5);
//        목록 페이지로 이동
        response.sendRedirect("../List.jsp");
    }
    else {
//        사용자가 입력한 id/pw와 일치하는 데이터가 없을 경우 오류메시지 출력 후 이전 페이지로 이동
        JSFunction.alertBack("ID나 비밀번호가 틀렸습니다.", out);
    }


%>