<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: pc--%>
<%--  Date: 2023-11-06--%>
<%--  Time: 오전 9:42--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>--%>

<%--&lt;%&ndash;게시판 정보를 가져오기 위해서 필요한 클래스 import&ndash;%&gt;--%>
<%--<%@ page import="com.bitc.project_lgh.database.TBoardDao" %>--%>
<%--<%@ page import="com.bitc.project_lgh.database.TBoardDto" %>--%>

<%--<%@ page import="java.util.List" %>--%>

<%--<%--%>
<%--    String userId = "";--%>
<%--    String userName = "";--%>

<%--    if (session.getAttribute("userId") != null) {--%>
<%--        userId = (String) session.getAttribute("userId");--%>
<%--        userName = (String) session.getAttribute("userName");--%>

<%--//        out.print("로그인 ID : " + userId + "<br>");--%>
<%--//        out.print("로그인 Name : " + userName + "<br>");--%>
<%--    }--%>

<%--//    게시판 목록 가져오기--%>
<%--    List<TBoardDto> boardList;--%>

<%--    TBoardDao dao = new TBoardDao(application);--%>
<%--    dao.dbOpen();--%>
<%--    boardList = dao.selectList();--%>
<%--    dao.dbClose();--%>


<%--%>--%>

<%--<html lang="ko">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <title>MVC1 게시판 - 목록 페이지</title>--%>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"--%>
<%--            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"--%>
<%--            crossorigin="anonymous"></script>--%>

<%--    <style></style>--%>
<%--    <script></script>--%>

<%--</head>--%>
<%--<body>--%>

<%--&lt;%&ndash;메뉴 파일 불러오기&ndash;%&gt;--%>
<%--<%@ include file="./layout/Menu.jsp"%>--%>

<%--&lt;%&ndash;Header파일 불러오기&ndash;%&gt;--%>
<%--<%@ include file="./layout/Header.jsp"%>--%>

<%--<main class="container mt-5">--%>
<%--    <section>--%>
<%--        <div class="row my-3">--%>
<%--            <div class="col-sm">--%>
<%--                <table class="table table-hover table-striped text-center">--%>
<%--                    <colgroup>--%>
<%--                        <col style="width: 5%;">--%>
<%--                        <col style="width: 55%;">--%>
<%--                        <col style="width: 10%;">--%>
<%--                        <col style="width: 5%;">--%>
<%--                        <col style="width: 15%;">--%>
<%--                    </colgroup>--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>번호</th>--%>
<%--                        <th>제목</th>--%>
<%--                        <th>작성자</th>--%>
<%--                        <th>조회수</th>--%>
<%--                        <th>작성일</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <%--%>
<%--                        // 가져옴 게시물 목록을 화면에 출력--%>
<%--                        for (TBoardDto board : boardList) {--%>
<%--                    %>--%>
<%--                        <tr>--%>
<%--                            <td><%=board.getNum()%></td>--%>
<%--&lt;%&ndash;                            클릭 시 상세페이지로 이동&ndash;%&gt;--%>
<%--                            <td class="text-start"><a href="View.jsp?num=<%=board.getNum()%>" class="text-decoration-none"><%=board.getTitle()%></a></td>--%>
<%--                            <td><%=board.getId()%></td>--%>
<%--                            <td><%=board.getVisitcount()%></td>--%>
<%--                            <td><%=board.getPostdate()%></td>--%>
<%--                        </tr>--%>
<%--                    <%--%>
<%--                        }--%>
<%--                    %>--%>

<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row my-3">--%>
<%--            <div class="col-sm">--%>
<%--                <div class="d-flex justify-content-end">--%>
<%--                    <a href="Write.jsp" class="btn btn-primary">글쓰기</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
<%--</main>--%>


<%--&lt;%&ndash;Footer파일 가져오기&ndash;%&gt;--%>
<%--<%@ include file="./layout/Footer.jsp"%>--%>
<%--</body>--%>
<%--</html>--%>


<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-11-14
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>


<%@ page import="com.bitc.project_lgh.database.TBoardDao" %>
<%@ page import="com.bitc.project_lgh.database.TBoardDto" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ page import="java.util.List" %>

<%
    TBoardDao dao = new TBoardDao();
    dao.dbOpen();

    int totalCount = dao.totalCount();
    int pageSize = 3;
    int blockPage = 5;
    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

    int pageNum = 1;
    String pageNumTemp = request.getParameter("pageNum");
    if (pageNumTemp != null && !pageNumTemp.equals("")) {
        pageNum = Integer.parseInt(pageNumTemp);
    }

    int start = (pageNum - 1) * pageSize;
    int end = pageNum * pageSize;

    int startPageNum = (((pageNum - 1) / blockPage) * blockPage) + 1;
    int endPageNum = startPageNum + blockPage - 1;

    if (endPageNum > totalPage) {
        endPageNum = totalPage;
    }

    List<TBoardDto> boardList = dao.selectTBoardListPaging(start, pageSize);
    dao.dbClose();

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>

    <style>
        body {
            background-image: url("./Park_img/sunshine.png");
        }
    </style>
    <script>

    </script>

</head>
<body>
<%@ include file="./layout/Menu.jsp" %>
<%-- Header 파일 불러오기 --%>
<%@ include file="./layout/Header.jsp" %>

<main class="container mt-5">

    <div class="container px-5 pb-5">
        <div class="row gx-5 align-items-center">
            <div class="col-xxl-5">
                <!-- Header text content -->
                <div class="text-center text-xxl-start">
                    <div class="badge bg-gradient-primary-to-secondary text-white mb-4">
                        <span class="text-uppercase">Design &middot; Development &middot; Marketing</span>
                    </div>
                    <p class="fs-3 fw-light text-muted">박완규는 열려있다!</p>
                    <h1 class="display-3 fw-bolder mb-5">
                        <span class="text-gradient d-inline">박완규와 소통해 보세요!</span>
                    </h1>
                    <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xxl-start mb-3">


                        <div class="ms-auto">
                            <%
                                //세션 정보를 가지고 로그인 상태를 확인
//                로그인 상태에 따라 화면 UI 변경
                                if (session.getAttribute("userId") == null) {
                                    out.print("<a href='login/LoginForm.jsp' class='btn btn-primary btn-lg px-5 py-3 me-sm-3 fs-6 fw-bolder'>로그인하여 소통하기                                                 </a>");
                                    out.print("<a class='btn btn-outline-dark btn-lg px-5 py-3 fs-6 fw-bolder' href='./login/MemberJoin.jsp'>회원가입</a>");
                                } else {
                            %>
                            <a href='login/Logout.jsp' class='btn btn-primary btn-lg px-5 py-3 fs-6 fw-bolder'>로그아웃</a>
                            <span class='px-5 py-3 fs-6 fw-bolder'><%=session.getAttribute("userName")%>님 반갑습니다.</span>
                            <%
                                }
                            %>
                        </div>


                    </div>
                </div>
            </div>
            <div class="col-xxl-7">
                <!-- Header profile picture -->
                <div class="d-flex justify-content-center mt-5 mt-xxl-0">
                    <div class="profile bg-gradient-primary-to-secondary">
                        <!-- TIP: For best results, use a photo with a transparent background like the demo example below -->
                        <!-- Watch a tutorial on how to do this on YouTube (link) -->
                        <img class="profile-img" src="../chap08/Park_img/flower.png" alt="...">
                        <div class="dots-1">
                            <!-- Include your SVG dots here -->
                        </div>
                        <div class="dots-2">
                            <!-- Include your SVG dots here -->
                        </div>
                        <div class="dots-3">
                            <!-- Include your SVG dots here -->
                        </div>
                        <div class="dots-4">
                            <!-- Include your SVG dots here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section>
        <div class="row">
            <div class="col-sm">
                <table class="table table-hover table-striped text-center">
                    <colgroup>
                        <col style="width: 10%">
                        <col style="width: 45%">
                        <col style="width: 15%">
                        <col style="width: 20%">
                        <col style="width: 10%">
                    </colgroup>
                    <thead>
                    <th>글번호</th>
                    <th>글제목</th>
                    <th>글쓴이</th>
                    <th>등록일</th>
                    <th>조회수</th>
                    </thead>
                    <tbody>
                    <%
                        if (boardList.size() == 0) {
                    %>
                    <tr>
                        <td colspan="5">등록된 게시물이 없습니다.</td>
                    </tr>
                    <%
                    } else {
                        for (TBoardDto item : boardList) {
                    %>
                    <tr onclick="location.href='View.jsp?num=<%=item.getNum()%>'">
                        <td><%=item.getNum()%>
                        </td>
                        <td>
                            <a href="View.jsp?num=<%=item.getNum()%>" class="text-decoration-none"><%=item.getTitle()%>
                            </a>
                            <%--                            <a href="View.jsp?title=<%=item.getTitle()%>" class="text-decoration-none"><%=item.getTitle()%></a>--%>
                        </td>
                        <td><%=item.getId()%>
                        </td>
                        <td><%=item.getPostdate()%>
                        </td>
                        <td><%=item.getVisitcount()%>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>

                </table>
            </div>
        </div>
        <div>
            <ul class="pagination justify-content-center">
                <%
                    String pagingStr = "";
                    if (startPageNum != 1) {
                        pagingStr += "<li class='page-item'><a class='page-link' href='./List.jsp?pageNum=" + (startPageNum - 1) + "'>Prev</a></li>";
                    }
                    for (int i = startPageNum; i <= endPageNum; i++) {
                        if (i == pageNum) {
                            pagingStr += "<li class='page-item active'><a class='page-link'>" + i + "</a></li>";
                        } else {
                            pagingStr += "<li class='page-item'><a class='page-link' href='./List.jsp?pageNum=" + i + "'>" + i + "</a></li>";
                        }
                    }
                    if (endPageNum < totalPage) {
                        pagingStr += "<li class='page-item'><a class='page-link' href='./List.jsp?pageNum=" + (endPageNum + 1) + "'>Next</a></li>";
                    }
                    out.print(pagingStr);
                %>
            </ul>
        </div>
        <div class="row mt-3">
            <div class="col-sm">
                <div class="d-flex justify-content-end">
                    <a href="Write.jsp" class="btn btn-primary">글쓰기</a>
                </div>
            </div>
        </div>
    </section>

</main>

<%@ include file="./layout/Footer.jsp" %>


</body>
</html>

<%--<div>--%>
<%--    <tr>--%>
<%--        <td colspan="5">--%>
<%--            &lt;%&ndash;                페이지 링크 버튼 &ndash;%&gt;--%>
<%--            <ul class="pagination justify-content-center">--%>
<%--                <%--%>
<%--                    //                  이전 페이지 버튼--%>
<%--//                  버튼 html 을 저장할 String 타입 변수--%>
<%--                    String pagingStr = "";--%>

<%--//                  시작 페이지 번호가 1이 아닐 경우 이전 페이지 표시, 1일 경우 표시안함--%>
<%--                    if (startPageNum != 1) {--%>
<%--                        pagingStr += "<li class='page-item'><a class='page-link' href='/TBoard/List.jsp?pageNum=" + (startPageNum - 1) + "'>Prev</a></li>";--%>
<%--                    }--%>
<%--//                  페이지 이동 블록을 반복문으로 생성--%>
<%--                    for (int i = startPageNum; i <= endPageNum; i++) {--%>
<%--                        if (i == pageNum) {--%>
<%--//                    현재 페이지 번호와 페이지 블록의 번호가 같을 경우 버튼 모양을 활성화--%>
<%--                            pagingStr += "<li class='page-item active'><a class='page-link'>" + i + "</a></li>";--%>
<%--                        }--%>
<%--                        else {--%>
<%--//                    현재 페이지와 번호와 페이지 블록의 번호가 다를 경우 링크 이동 주소 추가--%>
<%--                            pagingStr += "<li class='page-item'><a class='page-link' href='/TBoard/List.jsp?pageNum=" + i + "'>" + i + "</a></li>";--%>
<%--                        }--%>
<%--                    }--%>
<%--//                  다음 페이지 버튼--%>
<%--//                  페이지 블록 마지막 번호가 총 페이지 번호보다 작을 경우 다음 페이지 표시, 총 페이지 번호와 페이지 블록 마지막 번호가 같을 경우 표시 안함--%>
<%--                    if (endPageNum < totalPage) {--%>
<%--                        pagingStr += "<li class='page-item'><a class='page-link' href='/TBoard/List.jsp?pageNum=" + (endPageNum + 1) + "'>Next</a></li>";--%>
<%--                    }--%>

<%--//                  만들어진 문자열을 화면에 출력--%>
<%--                    out.print(pagingStr);--%>
<%--                %>--%>
<%--            </ul>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--</div>--%>
