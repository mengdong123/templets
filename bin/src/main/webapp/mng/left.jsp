<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!--  -->
    
        <!-- /左边 -->
        <div class="col-xs-2">
           <nav class="menu" id="mymenu">
                <ul class="nav nav-primary">
                  <li class="nav-parent show ">
                    <a href="javascript:;"> 订单信息</a>
                    <ul class="nav">
                      <li><a href="${path}/mng/index.jsp"><i class="icon-shopping-cart"></i> 我的订单<i class="icon-chevron-right"></i></a></li>
                      <li><a href="${path}/mng/address/list"><i class="icon-map-marker"></i> 地址管理<i class="icon-chevron-right"></i></a></li>
                    </ul>
                  </li>
                  <li class="nav-parent show">
                    <a href="javascript:;"> 个人信息</a>
                    <ul class="nav">
                      <li><a href="${path}/mng/member/info/${member.id}"><i class="icon-user"></i> 个人资料<i class="icon-chevron-right"></i></a></li>
                      <li><a href="${path}/mng/updatepwd.jsp"><i class="icon-eye-open"></i> 修改密码<i class="icon-chevron-right"></i></a></li>
                    </ul>
                  </li>
                  
                </ul>
              </nav>
        </div>
        <!-- /左边 -->