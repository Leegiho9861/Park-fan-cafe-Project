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
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MVC1 게시판 - 등록 페이지</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>

    <style>
        textarea.form-control {
            width: 100%; /* 원하는 너비로 조정해주세요 */
        }

        input.form-control {
            width: 100%; /* 원하는 너비로 조정해주세요 */
        }

        .bttn {
            width: 100%; /* 원하는 너비로 조정해주세요 */
        }


        .godPray {
            display: inline-block;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#btn-list").on("click", function () {
                location.href = "./List.jsp";
            });
        });
    </script>
    $(document).ready(function () {

</head>
<body>
<%@ include file="layout/Menu.jsp" %>
<%@ include file="layout/Header.jsp" %>

<main class="container mt-5">
    <section>
        <div class="row my-3">
            <div class="col-sm" style="margin-top: 20px">
                <form action="WriteProcess.jsp" method="post">
                    <div id="pic">
                        <div class="my-3">
                            <label for="title" class="form-label">제목</label>
                            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.">
                        </div>
                        <div class="my-3">
                            <label for="content" class="form-label">내용</label>
                            <textarea type="text" class="form-control" id="content" name="content" rows="5"
                                      placeholder="내용을 입력하세요."></textarea>
                        </div>
                    </div>
                    <div class="bttn">
                        <div class="my-3 d-flex justify-content-center">
                            <button type="submit" class="btn btn-primary">작성 완료</button>
                            <button type="reset" class="btn btn-secondary mx-2">다시 입력</button>
                            <button type="button" class="btn btn-info" id="btn-list">목록 보기</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-sm">
                <div class="my-3 godPray">
                    <div class="form-group">
                        <img src="./Park_img/godPray.png" alt="#">
                    </div>
                </div>
            </div>
        </div>
    </section>

</main>

<%@ include file="layout/Footer.jsp" %>
</body>
</html>
