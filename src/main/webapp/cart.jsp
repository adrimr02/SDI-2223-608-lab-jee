<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="counter" class="es.uniovi.sdi.Counter" scope="application" />
<jsp:setProperty name="counter" property="increase" value="1" />
<html lang="es">
<head>
  <title>Vista carrito</title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
      <ul class="nav navbar-nav">
        <li class="nav-item"><a class="nav-link" href="AddToShoppingCart">Carrito</a></li>
        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        <li class="nav-item"><a class="nav-link" href="admin.jsp">Administrar productos</a></li>
      </ul>
      <div class="nav navbar-right">
        <div class="center-block">
          <jsp:getProperty name="counter" property="total"/>
          Visitas
        </div>
      </div>
    </div>
  </nav>
  <div class="container" id="main-container">
    <h2>Vista Carrito</h2>
    <ul>
      <c:forEach var="item" items="${session.getAttribute('cart')}">
          <li>
            ${item.key} - ${item.value}
            <a href="RemoveFromCart?product=${item.key}">Eliminar</a>
          </li>
      </c:forEach>
    </ul>
    <a href="index.jsp">Volver</a>
  </div>
</body>
</html>
