<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="../icd_meta.jsp"></jsp:include>
<jsp:include page="../icd_css.jsp"></jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
<jsp:include page="../icd_title2.jsp"></jsp:include>
<!-- 主内容 -->
<div class="wrapper">
   <div class="row" style="padding: 20px 0px;">
       <!-- 左边 -->
         <jsp:include page="left.jsp"></jsp:include>
        <!-- 右边 -->
        <div class="col-xs-10">
            <div class="panel" style="min-height: 370px">
		        <div class="panel-heading">
		            <strong><i class="icon-user"></i> 修改资料</strong>
		        </div>
		        <div class="panel-body">
		        <form action="${path }/mng/member/update/${member.id}" method="post" id="ajaxForm" role="form" class="form-horizontal">
		            <div class="form-group">
                      <label class="col-xs-2 control-label">昵称</label>
                      <div class="col-xs-4 required">
                         <input type="text" name="nick_name" id="nickname" value="${member.nick_name }"  class="form-control">
                      </div>
                    </div>
		            <div class="form-group">
			          <label class="col-xs-2 control-label">真实姓名</label>
			          <div class="col-xs-4 required">
			             <input type="text" name="real_name" id="realname" value="${member.real_name }"  class="form-control">
			          </div>
			        </div>
			        <div class="form-group">
                      <label class="col-xs-2 control-label">手机号</label>
                      <div class="col-xs-4 required">
                         <input type="text" name="mobile" id="mobile" value="${member.mobile }" class="form-control">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-xs-2 control-label">性别</label>
                      <div class="col-md-4">
                        <label class="radio-inline"> <input type="radio" name="gender" value="1"
                        <c:if test="${member.gender==true }" var="bool">checked="checked"</c:if>
                        > 男 </label>
                        <label class="radio-inline"> <input type="radio" name="gender" value="0"
                        <c:if test="${!bool }" >checked="checked"</c:if>
                        > 女 </label>
                      </div>
                    </div>
	                <div class="form-group">
                      <label class="col-xs-2 control-label">邮箱号</label>
                      <div class="col-xs-4 required">
                         <input type="text" name="email" id="email" value="${member.email }" class="form-control"/>
                      </div>
                    </div>
                    <div class="form-group">
	                    <div class="col-xs-2"></div>
	                    <div class="col-xs-10">
	                        <button type="reset" id="resetBtn" class="btn btn-default">重置</button>&nbsp;&nbsp;
	                        <button type="submit" id="submitBtn" class="btn btn-primary" style="min-width: 80px">保存</button>
	                    </div>
                    </div>
	            </form>
		        </div>
		    </div>
        </div>
	    <!-- /右边 -->
    </div>
</div>
<!-- /主内容 -->

<jsp:include page="../icd_bottom.jsp"></jsp:include>
<jsp:include page="../icd_right.jsp"></jsp:include>
<!-- 新增地址的对话框 -->
<div class="modal fade" id="addAddressModal">
<div class="modal-dialog">
  <form action="./profile" method="post" id="ajaxForm" class="form-horizontal">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
      <h4 class="modal-title">新增地址</h4>
    </div>
    <div class="modal-body">
        <div class="form-group">
          <label class="col-xs-2 control-label">收货人</label>
          <div class="col-xs-4 required">
             <input type="text" name="contact" id="contact" placeholder="收货人姓名" class="form-control"/>
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2 control-label">电话</label>
          <div class="col-xs-4 required">
             <input type="text" name="phone" id="phone" placeholder="手机号" class="form-control"/>
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2 control-label">地址</label>
          <div class="col-xs-9 required">
             <input type="text" name="address" id="address" placeholder="详细地址" class="form-control"/>
          </div>
        </div>
    </div>
    <div class="modal-footer">
      <button type="reset" id="resetBtn" class="btn btn-default">重置</button>
      <button type="submit" id="submitBtn" class="btn btn-primary" style="min-width: 80px">保存</button>
    </div>
  </div>
  </form>
</div>
</div>
<!-- /新增地址 -->
<jsp:include page="../icd_js.jsp"></jsp:include>
</body>
</html>