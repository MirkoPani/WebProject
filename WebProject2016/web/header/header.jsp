<!--file da includere per usare header -->
<!-- <script src="js/login.js"></script> -->
<!--<link rel="stylesheet" href="css/header.css"> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- modal per login -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="loginmodal-container">
            <h1>Effettua il login</h1><br>
            <form method="post" id="formlogin">
                <div class="form-group">
                    <label for="email" class="control-label">Email</label>
                    <input type="text" id="email" name="email" required placeholder="Username">
                </div>
                <div class="form-group">
                    <label for="pass" class="control-label">Password</label>
                    <input type="password" id="password" name="pass" required placeholder="Password">
                </div>
                <span id="messaggio" class="label-warning"></span>
                <input type="submit" class="login loginmodal-submit" value="Login">

            </form>

            <div class="login-help">
                <a href="registration.jsp">Registrati</a> - <a href="maildimodifica.html">Password dimenticata?</a>
            </div>
        </div>
    </div>
</div>
<!--fine modal login -->
<!--inizio header -->
<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="PrepareHome">Tutto<span class="bistro">Bistr�</span></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav pull-right">
                <%-- //Se l'utente esiste nella sessionScope vuol dire che e' loggato e non ha bisogno di vedere il tasto login --%>
                <c:if test="${sessionScope.user == null}">
                    <li class=""><a href="#" data-toggle="modal" data-target="#login-modal">Accedi<span class="sr-only">(current)</span></a></li>
                    <li><a href="registration.jsp">Registrati</a></li>   
                    </c:if>



            </ul>
            <!--   <form class="navbar-form navbar-left">
                   <div class="form-group">
                       <input type="text" class="searchbar form-control" placeholder="Search">
                   </div>
               </form> -->
            <c:if test="${sessionScope.user != null}">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="PrepareNewRestaurantForm">Aggiungi Ristorante</a>
                    </li>
                     <c:if test="${user.type gt 0}">
                    <li><a href="SearchNotification">Notifiche</a>

                    </li>
                    </c:if>
                    <li class="dropdown" >
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span>
                            <span class="headerUsername"> <c:out value="${user.nickname}" /></span>
                            <span class="glyphicon glyphicon-menu-down"></span>
                        </a>
                        <ul class="dropdown-menu" id="dropdown">
                            <li>
                                <div class="navbar-login">
                                    <div class="row">

                                        <div class="col-sm-12">
                                            <p class="text-left"><strong><c:out value="${user.name}" /> <c:out value="${user.surname}" /></strong></p>
                                            <p class="text-left small"><c:out value="${user.email}" /></p>
                                            <p class="text-left">
                                                <a href="UserAccountPage" class="btn btn-yellow btn-block ">Il mio Profilo</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="navbar-login navbar-login-session">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <p>
                                            <form action="LogoutAttempt" method="post">
                                                <button class="btn btn-purple btn-block" type="submit" name="logout" value="logout" class="btn-link">Disconnettiti</button>
                                            </form>
                                            <!--<a href="#" class="">Disconnettiti</a> -->
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </c:if>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<!--fine header -->