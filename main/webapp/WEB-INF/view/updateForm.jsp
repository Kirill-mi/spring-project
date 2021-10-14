<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Add news</title>
    <style>
        .form-style-10 {
            width: 850px;
            padding: 30px;
            margin: 40px auto;
            background: #FFF;
            border-radius: 10px;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.13);
            -moz-box-shadow: 0 0 10px rgba(0, 0, 0, 0.13);
            -webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.13);
        }

        .form-style-10 .inner-wrap {
            padding: 30px;
            background: #F8F8F8;
            border-radius: 6px;
            margin-bottom: 15px;
            resize: none;
        }

        .form-style-10 h1 {
            background: #2A88AD;
            padding: 20px 30px 15px 30px;
            margin: -30px -30px 30px -30px;
            border-radius: 10px 10px 0 0;
            -webkit-border-radius: 10px 10px 0 0;
            -moz-border-radius: 10px 10px 0 0;
            color: #fff;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
            font: normal 30px 'Bitter', serif;
            -moz-box-shadow: inset 0 2px 2px 0 rgba(255, 255, 255, 0.17);
            -webkit-box-shadow: inset 0 2px 2px 0 rgba(255, 255, 255, 0.17);
            box-shadow: inset 0 2px 2px 0 rgba(255, 255, 255, 0.17);
            border: 1px solid #257C9E;
        }

        .form-style-10 h1 > span {
            display: block;
            margin-top: 2px;
            font: 13px Arial, Helvetica, sans-serif;
        }

        .form-style-10 label {
            display: block;
            font: 13px Arial, Helvetica, sans-serif;
            color: #888;
            margin-bottom: 15px;
        }

        .form-style-10 input[type="button"]:hover,
        .form-style-10 input[type="submit"]:hover {
            background: #2A6881;
            -moz-box-shadow: inset 0 2px 2px 0 rgba(255, 255, 255, 0.28);
            -webkit-box-shadow: inset 0 2px 2px 0 rgba(255, 255, 255, 0.28);
            box-shadow: inset 0 2px 2px 0 rgba(255, 255, 255, 0.28);
        }

        .form-style-10 .privacy-policy {
            float: right;
            width: 250px;
            font: 12px Arial, Helvetica, sans-serif;
            text-decoration-color: red;
            color: #ff0000;
            margin-top: 10px;
            text-align: right;
        }</style>
</head>
<body>
<div class="form-style-10">
    <h1><spring:message code="local.text.edit.news"/><span><spring:message code="local.text.edit.news"/></span></h1>
    <form action="${pageContext.request.contextPath}/news/main">
        <button><spring:message code="local.button.main"/></button>
    </form>
    <form:form action="update" modelAttribute="news" method="POST">
    <div class="inner-wrap">
        <form:hidden path="id"/>
        <br>
        <spring:message code="local.news.title"/>:<br>
        <form:input path="title"/>
        <form:errors path="title" style="color: red;"/>

        <br>
        <spring:message code="local.news.text"/>:<br>
        <form:input path="brief"/>
        <br>
        <spring:message code="local.news.text"/>:<br>
        <form:textarea path="text"/>
    </div>
    <br>
    <br>
    <br>
    <input type="submit" value=
        <spring:message code="local.button.submit"/>
    </form:form>
            </body>
</html>
