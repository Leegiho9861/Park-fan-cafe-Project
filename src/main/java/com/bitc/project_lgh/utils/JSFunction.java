package com.bitc.project_lgh.utils;


import jakarta.servlet.jsp.JspWriter;

// jsp코드 중단게 자바스크립트를 쉽게 동작시키기 위한 유틸 클래스
public class JSFunction {
//    화면에 출력한 메시지와 이동할 URL을 입력받아 메시지 출력 및 화면 이동을 위한 정적 메소드
    public static void alertLocction(String msg, String url, JspWriter out){
//        JspWriter : JSP 페이지에서 html 태그로 View 화면에 출력을 하기 위한 내장 객체
//        JspWriter를 기본 java 클래스에는 내장 객체로 선언되어 있지 않기 때문에 매개변수로 받아서 처리함
        try{
            String script = "<script>";
            script += "alert('" + msg + "');";
            script += "location.href = '" + url + "';";
            script += "</script>";

            out.print(script);
        }
        catch (Exception e){}
    }

//    화면에 출력할 메시지를 입력받아 메시지 출력 및 이전 페이지로 이동을 위한 정적 메소드
    public static void alertBack(String msg, JspWriter out) {
        try{
            String script = "<script>";
            script += "alert('" + msg + "');";
            script += "history.back();";
            script += "</script>";

            out.print(script);

        }
        catch (Exception e){}
    }
}
