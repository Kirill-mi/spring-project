<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
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
    <h1><spring:message code="local.news"/><span><spring:message code="local.text.news"/></span></h1>

    <form action="${pageContext.request.contextPath}/news/createForm">
        <button><spring:message code="local.create.news"/></button>
    </form>
    <br>
    <form action="${pageContext.request.contextPath}/registrationPage">
        <button><spring:message code="local.button.authorization"/></button>
    </form>
    <span style="float: right">
          <button onclick="window.location.href = '?lang=en&page=${page}'">
              <spring:message code="local.button.name.en"/></button>
            <button onclick="window.location.href = '?lang=ru&page=${page}'">
                <spring:message code="local.button.name.ru"/></button>
        </span>

    <table>

        <c:forEach var="newsList" items="${newsArray}">

            <c:url var="read" value="/news/read">
                <c:param name="newsId" value="${newsList.id}"/>
            </c:url>

            <c:url var="update" value="/news/updateForm">
                <c:param name="newsId" value="${newsList.id}"/>
            </c:url>

            <c:url var="delete" value="/news/delete">
                <c:param name="newsId" value="${newsList.id}"/>
            </c:url>

            <tr>
                <td><br>${newsList.title}<br></td>
            </tr>
            <tr>
                <td>${newsList.brief}<br></td>
                <td><a href="${read}"><spring:message code="local.button.read"/></a>
                    <a href="${update}"><spring:message code="local.button.update_news"/></a>
                    <a href="${delete}"
                       onclick="if (!(confirm(<spring:message code="local.message.sure"/>)))
                               return false"><spring:message code="local.button.delete_news"/></a>
                </td>
            </tr>

        </c:forEach>
        <tr>
            <td><br> <c:forEach begin="${1}" end="${pages}" step="1" varStatus="i">
                <c:url value="/news/main" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href="${url}">${i.index}</a>
            </c:forEach></td>
        </tr>
    </table>
</div>
</body>
</html>
