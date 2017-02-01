<%-- 
    Document   : showreplyconfirm
    Created on : 15-ott-2016, 19.47.36
    Author     : Marco
--%>
<%@page import="beans.NotificationRepliesBean"%>
<%@page import="beans.NotificationBean"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <jsp:include page="header/headerFiles.jsp" />
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/generic.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Conferma notitfica</title>
    </head>
    <body> 
        <jsp:include page = "header/header.jsp"/>
        <div class="container-fluid">
            <c:set var="idrepl" value="${param.id}"></c:set>

            <!--Ricerca della notifica in base all'id-->
            <c:forEach var="notbean" items="${noty.replies}">
                <c:if test="${notbean.idrep == idrepl}">
                    <c:set var="repliestoconfirm" value="${notbean}"></c:set>
                </c:if>
            </c:forEach>
            <!-- Pannello per mostrare la notifica -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3><strong><c:out value="${repliestoconfirm.customer}"></c:out></strong></h3>
                    <c:out value="${repliestoconfirm.reviewdescription}"></c:out>
                    <!-- Stampo la notifica -->
                    <div style="padding-left:50px">
                            <h3><strong><c:out value="${repliestoconfirm.ristoratore}"></c:out></strong></h3>
                        <c:out value="${repliestoconfirm.replydescription}"></c:out>
                        <div style="text-align:right">
                            <div class="form-group">
                                <!--Setto i parametri da spedire alla servlet attraverso i due bottoni -->
                                <c:url value="ConfirmRepliesServlet" var="repliesURL">
                                    <c:param name="id" value="${param.id}" />
                                </c:url>
                                <!-- L'if serve per tenere nascosti i bottoni in caso in cui io acceda alla pagina passando per le "noticiche già accettate -->
                                <c:if test="${param.sh == true}">
                                    <form action="${repliesURL}" method="POST">
                                        <button type="submit"  name="button" class="btn btn-danger " value='d'>Rifiuta</button>
                                        <button type="submit"  name="button" class="btn btn-success" value='a'>Accetta</button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
