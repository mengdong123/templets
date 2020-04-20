<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="icd_meta.jsp"></jsp:include>
<jsp:include page="icd_css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="icd_title2.jsp"></jsp:include>
<div id="loginPanel">
	<div class="panel">
	  <div class="panel-heading">后台管理登录</div>
	  <div class="panel-body">
	      <form action="./mng/main.jsp" method="post">
             <div class="form-group hide"><div id="formError" class="alert alert-danger"></div></div>
             <div class="form-group"><input type="text" name="lname" id="lname" placeholder="请输入用户名" class="form-control"/></div>
             <div class="form-group"><input type="password" name="pwd" id="pwd" placeholder="请输入密码" class="form-control"/></div>
             <div class="form-group" style="text-align: center;">
             <button type="reset" id="reset" class="btn btn- default">重置</button>&nbsp;&nbsp;
             <button type="submit" id="submit" class="btn btn-primary">登录</button>
             </div>
           </form>
	  </div>
	</div>
</div>
<jsp:include page="icd_js.jsp"></jsp:include>
</body>
</html>