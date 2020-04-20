<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${path}/zui/lib/jquery/jquery.js"></script>
<script src="${path}/zui/js/zui.js"></script>
<script src="${path}/js/jquery.scrollUp.min.js"></script>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script src="${path}/js/my.js"></script>

<!-- 表单验证 -->
<script src="${path}/js/bootstrapValidator.min.js"></script>

<!-- 登录表单验证==开始 -->
<script type="text/javascript">
$(document).ready(function() {
    $('#defaultForm')
        .bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	mobile: {
                    message: '请输入注册时的11位手机号',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '请输入11位的手机号码'
                        },
                       
                    }
                },
                pwd: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                },
            }
        })
       
});
</script>
   <!-- 登录表单验证==结束 -->