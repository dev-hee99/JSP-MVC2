<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8"/>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
   url="jdbc:mariadb://localhost:3306/experdb"
   user="Exper" password="1234" />
<sql:query var="rs" dataSource="${conn}">
select email from expermember where email=?
   <sql:param>${param.email}</sql:param>
</sql:query>

<c:if test="${!empty rs.rows }">
   <h1 class="find"></h1>
</c:if>
<c:if test="${empty rs.rows }">
   <h1 class="notfound"></h1>
</c:if>