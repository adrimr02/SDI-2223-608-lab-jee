<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="product" class="es.uniovi.sdi.Product" />
<jsp:setProperty name="product" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>Servlets</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${sessionScope.user != 'admin'}">
    <c:redirect url="/login.jsp" />
</c:if>

<c:if test="${product.name != null}">
    <jsp:useBean id="productService" class="es.uniovi.sdi.ProductService" />
    <jsp:setProperty name="productService" property="newProduct" value="${product}" />
    <c:redirect url="/index.jsp" />
</c:if>
<%--
    if (product.getName() != null) {
        new ProductService().setNewProduct(product);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
--%>
<!-- Contenido -->
<div class="container" id="contenedor-principal">
    <h2>Añadir contenido a la tienda</h2>
    <form class="form-horizontal" action="admin.jsp" method="POST">
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Nombre:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="image">URL imagen:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="image" name="image" required/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="price">Precio (€):</label>
            <div class="col-sm-10">
                <input type="number" step="0.01" class="form-control" id="price" name="price"
                       required/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Agregar</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>

