<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-07
  Time: 오후 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>

    <style></style>
    <script></script>

</head>
<body>
<%--중복되는 메뉴 내용을...--%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <div class="container-fluid">
        <a href="/index.jsp" class="navbar-brand">꽃보다 박완규</a>
<%--        <div>--%>
<%--&lt;%&ndash;            <ul class="navbar-nav">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <li class="nav-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <a class="nav-link" href="#">메뉴1</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <li class="nav-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <a class="nav-link" href="#">메뉴2</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <li class="nav-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <a class="nav-link" href="#">메뉴3</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </ul>&ndash;%&gt;--%>
<%--        </div>--%>
<%--        <div class="ms-auto">--%>
<%--            <%--%>
<%--                //세션 정보를 가지고 로그인 상태를 확인--%>
<%--//                로그인 상태에 따라 화면 UI 변경--%>
<%--                if (session.getAttribute("userId") == null) {--%>
<%--                    out.print("<a href='login/LoginForm.jsp' class='btn btn-outline-success'>로그인</a>");--%>
<%--                }--%>
<%--                else {--%>
<%--            %>--%>
<%--            <span class="navbar-text me-3"><%=session.getAttribute("userName")%>님 반갑습니다.</span>--%>
<%--            <a href="login/Logout.jsp" class="btn btn-outline-secondary">로그아웃</a>--%>
<%--            <%--%>
<%--                }--%>
<%--            %>--%>
<%--        </div>--%>
    </div>
</nav>
</body>
</html>
