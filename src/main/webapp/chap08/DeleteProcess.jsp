<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-06
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.project_lgh.database.TBoardDao" %>
<%@ page import="com.bitc.project_lgh.utils.JSFunction" %>


<%--로그인 상태에서만 글 삭제를 할 수 있으므로 로그인 상태 체크를 위한 LoginCheck 파일 불러오기--%>

<%@ include file="login/LoginCheck.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
// 글 삭제를 위해 필요한 정보 파라미터 값에서 가져오기
    int num = Integer.parseInt(request.getParameter("num"));
    String id = request.getParameter("id");

//          글 삭제 시 글 작성자가 현재 로그인한 사용자인지 확인
     if (id.equals((String)session.getAttribute("userId"))){
//    if (id.equals("test1")){
//         작성자와 로그인한 사용자가 같으면 데이터 베이스에 연결 후 글 삭제
        TBoardDao dao = new TBoardDao(application);
        dao.dbOpen();
        int result = dao.deletePost(num);
        dao.dbClose();

//        정상적으로 삭제되었는지 확인
        if (result == 1){
//            정상 삭제 시 목록 페이지로 이동
            JSFunction.alertLocction("삭제 되었습니다", "./List.jsp", out);
//             out.print("<script>");
//             out.print("alert('삭제 되었습니다');");
//             out.print("location.href = './List.jsp';");
//             out.print("</script>");
        }
        else {
//            정상 삭제가 아닐 경우 이전 페이지로 이동
            JSFunction.alertBack("삭제 중 오류가 발생했습니다", out);
//             out.print("<script>");
//             out.print("alert('삭제 중 오류가 발생했습니다');");
//             out.print("history.back();");
//             out.print("</script>");
        }
    }
    else{
//         작성자와 로그인한 사용자가 같지 않으면 뒤로 가기
        JSFunction.alertBack("삭제 권한이 없습니다", out);
//         out.print("<script>");
//         out.print("alert('삭제 권한이 없습니다');");
//         out.print("history.back();");
//         out.print("</script>");
    }
%>
