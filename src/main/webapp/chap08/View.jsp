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

<%-- 상세 글 보기 페이지는 로그인 이 필요 없으므로 로그인 상태 체크를 위한 LoginCheck 파일을 불러오지 않음--%>
<%
    // 현재 글에 대한 상세 정보를 가져와야 하므로 데이터 베이스 연결 및 글 정보 가져오기
    request.setCharacterEncoding("UTF-8");

//    현재 글 번호를 파라미터 값에서 가져오기
    int num = Integer.parseInt(request.getParameter("num"));

//    데이터베이스 연결
    TBoardDao dao = new TBoardDao(application);
    dao.dbOpen();
//    글 조회수 증가
    dao.updateVisitCount(num);

//    상세 글 정보 가져오기
    TBoardDto board = dao.selectView(num);
    dao.dbClose();
%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MVC1 게시판 - 상세 페이지</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>

    <style>
        .caption1 {width: 14%;}

        .caption2 {width: 7%;}

        /*.bg-image {*/
        /*    background-image: url('./Park_img/sexyguy.png');*/
        /*    background-repeat: no-repeat;*/
        /*    background-size: cover;*/
        /*    background-position: center center;*/
        /*}*/
        body {
            background-image: url('./Park_img/sexyguy.png');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            background-image-opacity: 0.5;
        }
    </style>
    <script>
<%--        html이 모두 로딩된 이후 아래의 자바스크립트가 동작하도록 하는 이벤트--%>
        $(document).ready(function () {
            // 수정 버튼 클릭
            $("#btn-edit").on("click", function () {
                // 글 번호를 검색하여 가져오기
                const num = $("#num").val();
                // 글 수정 페이지로 이동, 파라미터 값으로 글 번호를 추가함
                location.href = "./Edit.jsp?num=" + num;
            });

            // 삭제 버튼 클릭
            $("#btn-delete").on("click", function () {
                // 확인/취소 버튼이 있는 확인창 출력
                const confirmed = confirm("정말로 삭제 하시겠습니까?")

                // 확인 버튼 클릭 시 삭제
                if (confirmed == true) {
                    // form 태그 검색
                    const frm = $("#frm")[0];
                    // form 태그의 action속성 변경, Deleteprocess 로 이동
                    frm.action = "./DeleteProcess.jsp";
                    frm.submit();
                }
            });

            // 목록 버튼 클릭
            $("#btn-list").on("click", function () {
                // 목록 페이지로 이동
                location.href = "./List.jsp";
            });
        });
    </script>

</head>
<%@ include file="layout/Menu.jsp"%>


<%@ include file="layout/Header.jsp"%>

<%--데이터 베이스에서 가져온 상세 글 화면 출력--%>
<main class="container mt-5">
    <section>
        <h2 class="text-center" style="margin-top: 250px"><%=board.getId()%>의 남자 박완규</h2>
        <form id="frm" method="post">
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
                        <input type="text" class="form-control" name="id" id="id" readonly value="<%=board.getId()%>">
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
                        <input type="text" class="form-control" readonly value="<%=board.getTitle()%>">
                    </div>
                </div>
            </div>
            <div class="row my-3">
                <div class="col-sm">
                    <div class="input-group">
                        <span class="input-group-text caption2">내용</span>
                        <textarea class="form-control" rows="5" readonly><%=board.getContent()%></textarea>
                    </div>
                </div>
            </div>
            <div class="row my-3">
                <div class="col-sm d-flex justify-content-center">
                    <button type="button" class="btn btn-warning" id="btn-edit">수정하기</button>
                    <button type="button" class="btn btn-danger mx-2" id="btn-delete">삭제하기</button>
                    <button type="button" class="btn btn-secondary" id="btn-list">목록 보기</button>
                </div>
            </div>
        </form>

    </section>
</main>
<%@ include file="layout/Footer.jsp"%>
</body>
</html>
