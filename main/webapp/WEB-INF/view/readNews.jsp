<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/WEB-INF/css/style.css"/>"/>
    <title>Pump Project</title>
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

    </style>
</head>

<body>
<div class="form-style-10">
    <h1><spring:message code="local.news"/><span><spring:message code="local.text.news"/></span></h1>
    <form action="${pageContext.request.contextPath}/news/main">
        <button><spring:message code="local.button.main"/></button>
    </form>

    <div class="title">${news.title}</div>
    <div class="context">${news.author}</div>
    <div class="date">${news.date}</div>
    <br>
    <br>
    <br>
    <div class="context">${news.text}</div>
    <br>
    <br>

</div>
</body>
</html>
