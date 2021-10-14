<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/WEB-INF/css/style.css"/>"/>
    <title>Login</title>
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
        }</style>

</head>
<body>
<div class="form-style-10">
    <h1><spring:message code="local.button.authorization"/><span><spring:message
            code="local.button.authorization"/></span></h1>
    <form:form action="${pageContext.request.contextPath}/authenticateUser" method="POST">
    <p>
        <input type="text" placeholder="<spring:message code="local.username" />" name="name"/>
        <br>
        <form:errors path="userName" cssClass="error"/>
    </p>
    <p>
        <input type="password" placeholder="<spring:message code="local.password" />" name="pass"/><br>
        <form:errors path="password" cssClass="error"/>
    </p>
    <br>
    <input type="submit"/>
    </form:form>

</body>
</html>