<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h3>列表&nbsp;&nbsp;&nbsp;<a  href="${path}/mng/user/add.jsp">添加用户</a></h3>
 
 <table  style="width: 80%"  border="1px">
 <tr>
 <td>编号</td><td>姓名</td><td>年龄</td><td>出生日期</td><td>操作</td>
 </tr>
 <c:forEach  items="${list}" var="user">
 <tr>
 <td>${user.id}</td><td>${user.name}</td><td>${user.age}</td><td>${user.birthday}</td><td><a href="${path}/mng/user/delete/${user.id}">删除</a><a href="${path}/mng/user/edit/${user.id}">编辑</a></td>
 </tr>
 </c:forEach>
 
 </table>

</body>
</html>