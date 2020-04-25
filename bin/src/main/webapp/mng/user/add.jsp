<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h3>更新</h3>
  
  <form action="${path}/mng/user/insert"  method="post"  >
  <table  style="width: 60%"  border="1px">
   <tr>
 <td>编号</td>
   <td><input type="text"  name="id"/></td>
 
 </tr>
 <tr><td>姓名</td>
  <td><input type="text"  name="name"/></td>
 </tr>
 <tr><td>年龄</td>
  <td><input type="text"  name="age"/></td>
 </tr>
 <tr><td>出生日期</td>
  <td><input type="text"  name="birthday"/></td>
 </tr>
 <tr><td  colspan="2">
  <td><input type="submit" value="添加"/></td>
 </tr>
  </table>
  </form>

</body>
</html>