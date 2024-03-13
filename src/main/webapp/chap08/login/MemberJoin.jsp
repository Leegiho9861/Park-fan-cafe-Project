<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-11-08
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

<style>
    .parkImg{
        background-image: url("../Park_img/godHug-removebg-preview.png");
        background-repeat: no-repeat;
        background-position: center;
        background-size: contain;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 70vh;
        margin-top: 50px; /* 원하는 만큼의 여백을 추가해주세요 */
    }
</style>
<script>
    $(document).ready(function (){
        $("#btn-cancel").on("click",function (){
            history.back()
        });
    });
</script>

<body>
<%@include file="../layout/Menu.jsp"%>>
<%@include file="../layout/Header.jsp"%>>

<main class="container mt-5">
    <section>
        <div class="row parkImg">
            <div class="col-sm-4 mx-auto" style="margin-top: 350px">
                <form action="./MemberJoinProcess.jsp" method="post">
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" id="id" name="id" placeholder="사용자 ID를 입력하세요">
                        <label for="id">User ID</label>
                    </div>
                    <div class="form-floating my-3">
                        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">
                        <label for="pwd">User Password</label>
                    </div>
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" id="name" name="name" placeholder="사용자 이름을 입력하세요">
                        <label for="name">User Name</label>
                    </div>
                    <div class="my-3 d-grid gap-2">
                        <button type="submit" class="btn btn-primary">회원 가입</button>
                        <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</main>
</body>
</html>
