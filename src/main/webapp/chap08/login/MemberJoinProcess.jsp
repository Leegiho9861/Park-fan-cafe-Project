<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-11-08
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%--데이터 베이스를 제어하기 위한 클래스 import--%>
<%@ page import="com.bitc.project_lgh.database.TBUserDao" %>
<%@ page import="com.bitc.project_lgh.database.TBUserDto" %>
<%--자바스크립트를 사용하기 위한 클래스 import--%>
<%@ page import="com.bitc.project_lgh.utils.JSFunction" %>

<%
    // 회원 가입을 위한 파라미터 값 가져오기
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String name = request.getParameter("name");

    TBUserDto member = new TBUserDto();
    member.setId(id);
    member.setPass(pwd);
    member.setName(name);

    TBUserDao dao = new TBUserDao(application);
    dao.dbOpen();
    int result = dao.insertMember(member);
    dao.dbClose();


    if (result > 0){
        JSFunction.alertLocction("회원가입 되었습니다", "./LoginForm.jsp", out);
    }
    else {
        JSFunction.alertBack("회원 가입 중 오류가 발생했습니다", out);
    }

%>