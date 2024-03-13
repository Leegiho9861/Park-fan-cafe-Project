<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-06
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.project_lgh.database.TBoardDao" %>
<%@ page import="com.bitc.project_lgh.database.TBoardDto" %>

<%--로그인 상태에서만 글 수정을 할 수 있으므로 로그인 상태 체크를 위한 LoginCheck 파일 불러오기--%>
<jsp:include page="login/LoginCheck.jsp"></jsp:include>


<%--글 수정 페이지는 상세 글 읽기 페이지와 기본적으로 같음--%>
<%
    request.setCharacterEncoding("UTF-8");

//    수정할 글 번호 가져오기
    int num = Integer.parseInt(request.getParameter("num"));

//    데이터 베이스 연결 후 글 내용 가져오기
    TBoardDao dao = new TBoardDao(application);
    dao.dbOpen();
    TBoardDto board = dao.selectView(num);
    dao.dbClose();
%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MVC1 게시판 - 수정 페이지</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>

    <style>
        .caption1 {width: 14%;}
        .caption2 {width: 7%;}
    </style>
    <script>
        $(document).ready(function () {
            // 목록 버튼 클릭 시 목록 페이지로 이동
            $("#btn-list").on("click", function () {
                location.href = "./List.jsp";
            });

            // html 속성 중 id 가 title인 태그를 자동 선택하기
            $("#title").focus();
        });

    </script>

</head>
<body>
<%@ include file="layout/Menu.jsp"%>

<%@ include file="layout/Header.jsp"%>

<main class="container mt-5">
    <section>
        <form id="frm" action="EditProcess.jsp" method="post">
            <div class="row my-3">
                <div class="col-sm">
                    <div class="input-group">
                        <span class="input-group-text caption1">번호</span>
                        <input type="text" class="form-control" id="num" name="num" readonly value="<%=board.getNum()%>">
                    </div>
                </div>
                <div class="col-sm">
                    <div class="input-group">
                        <span class="input-group-text caption1">작성자</span>
                        <input type="text" class="form-control" id="id" name="id" readonly value="<%=board.getId()%>">
                    </div>
                </div>
            </div>
            <div class="row my-3">
                <div class="col-sm">
                    <div class="input-group">
                        <span class="input-group-text caption1">작성일</span>
                        <input type="text" class="form-control" readonly value="<%=board.getPostdate()%>">
                    </div>
                </div>
                <div class="col-sm">
                    <div class="input-group">
                        <span class="input-group-text caption1">조회수</span>
                        <input type="text" class="form-control" readonly value="<%=board.getVisitcount()%>">
                    </div>
                </div>
            </div>
            <div class="row my-3">
                <div class="col-sm">
                    <div class="input-group">
                        <span class="input-group-text caption2">제목</span>
                        <input type="text" class="form-control" id="title" name="title" value="<%=board.getTitle()%>">
                    </div>
                </div>
            </div>
            <div class="row my-3">
                <div class="col-sm">
                    <div class="input-group">
                        <span class="input-group-text caption2">내용</span>
                        <textarea class="form-control" name="content" rows="5"><%=board.getContent()%></textarea>
                    </div>
                </div>
            </div>
            <div class="row my-3">
                <div class="col-sm d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary">작성완료</button>
                    <button type="reset" class="btn btn-secondary mx-2">다시 입력</button>
                    <button type="button" class="btn btn-info" id="btn-list">목록 보기</button>
                </div>
            </div>
        </form>

    </section>
</main>
<%@ include file="layout/Footer.jsp"%>
</body>
</html>
