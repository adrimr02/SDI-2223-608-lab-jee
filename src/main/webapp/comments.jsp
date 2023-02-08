<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="counter" class="es.uniovi.sdi.Counter" scope="application" />
<jsp:setProperty name="counter" property="increase" value="1" />
<jsp:useBean id="comment" class="es.uniovi.sdi.Comment" />
<jsp:setProperty name="comment" property="*" />
<%--Se rompe al intentar crear un nuevo comentario--%>
<html>
<head>
  <title>Servlets</title>
  <title>Servlets</title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
  <c:if test="${comment.username != null}">
    <jsp:useBean id="commentService" class="es.uniovi.sdi.CommentService" />
    <jsp:setProperty name="commentService" property="newComment" value="${comment}" />
    <c:redirect url="/comments.jsp#comments" />
  </c:if>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="collapse navbar-collapse" id="my-navbarColor02">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item ">
          <a class="nav-link" href="AddToShoppingCart">Carrito<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="login.jsp">Login<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="admin.jsp">Administrar productos<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="products">Productos<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="comments.jsp">Comentarios<span class="sr-only">(current)</span></a>
        </li>
      </ul>
      <div class="nav navbar-right">
        <jsp:getProperty name="counter" property="total" /> Visitas
      </div>
    </div>
  </nav>
  <div class="container" id="main-container">
    <h2>Comentarios</h2>
    <h3>Añade un comentario</h3>
    <form class="form-horizontal" method="post" action="">
      <div class="form-group">
        <label class="control-label col-sm-2" for="username">Nombre:</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="username" name="username" required="true"/>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-sm-2" for="comment">Comentario:</label>
        <div class="col-sm-10">
          <textarea class="form-control" id="comment" name="comment" required="true"></textarea>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <button type="submit" class="btn btn-primary">Enviar</button>
        </div>
      </div>
    </form>
    <div id="comments">
      <c:forEach var="comment" begin="0" items="${commentService.comments}">
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
          <div>
            <h4>${comment.username}</h4>
            <p>${comment.comment}</p>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</body>
</html>
