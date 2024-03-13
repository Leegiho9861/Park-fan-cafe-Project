<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-07
  Time: 오후 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%--현재 페이지가 어떤 페이지인지 확인 후 페이지 이름 결정--%>
<%
    String pageName = "";

//    주소 가져오기
    String result = request.getRequestURI();
//    lastIndexOf(문자열) : 지정한 문자열이 전체 문자열 중 뒤에서 부터 검색하여 몇번째 index 위치인지 알려주는 메소드
    int index = result.lastIndexOf("/") + 1;
//    subString(위치) : 지정한 위치에서 문자열 잘라오기
    result = result.substring(index);

////   가져온 주소가 문자열이 아래와 같으면 이름을 pageName에 저장하여 변경함
//    switch (result){
//
//    case "List.jsp":
//         pageName = "목록";
//         break;
//
//     case "Write.jsp":
//         pageName = "글쓰기";
//         break;
//
//     case "View.jsp":
//         pageName = "상세";
//         break;
//
//     case "Edit.jsp":
//         pageName = "수정";
//         break;
//
//        case "LoginForm.jsp":
//        pageName = "로그인";
//            break;
//
//        case "MemberJoin.jsp":
//            pageName = "회원 가입";
//            break;
//    }

// 밑에 주소가 출력됨
//    /chap08/Write.jsp
//    /chap08/List.jsp
//    /chap08/View.jsp
//    /chap08/Edit.jsp
//    /chap08/login/LoginForm.jsp
%>

<%--<header class="p-sm-5 text-center" style="margin-top: 100px">--%>
<%--    <div class="container">--%>
<%--        <div class="rounded-3 bg-secondary bg-opacity-25 px-4 py-5">--%>
<%--            <h1 class="display-4">회원제 게시판 - <%=pageName%> 페이지</h1>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</header>--%>

