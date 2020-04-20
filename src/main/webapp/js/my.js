
$(function() {
	/*购物车物品的显示*/
	$("#cart").hover(function(){
        $("#cart-list").show();
    }, function(){
        $("#cart-list").hide();
    });
	
	/*所有分类列表*/
	var $cates = $("#categories");
	if($cates[0]){
		$("#menu").hide();
		$("#dropdown").addClass("icon-angle-down");
		$cates.hover(function(){
			$("#menu").show();
			$("#dropdown").removeClass("icon-angle-down");
		},function(){
			$("#menu").hide();
			$("#dropdown").addClass("icon-angle-down");
		});
	}
	
	/*所有分类的子分类列表*/
	$("#menu .cate-list li").hover(function(){
        $(".sub-list", $(this)).show();
    },function(){
        $(".sub-list", $(this)).hide();
    });
	
	/*侧边栏QQ*/
	$(".sidebar-qq").hover(function(){
		$(".qq", $(this)).show();
	}, function(){
		$(".qq", $(this)).hide();
	});
	/*侧边栏电话*/
    $(".sidebar-phone").hover(function(){
        $(".phone", $(this)).show();
    }, function(){
        $(".phone", $(this)).hide();
    });
	
    /*侧边栏微信公共号*/
    $(".sidebar-wx").hover(function(){
        $(".pic", $(this)).show();
    }, function(){
        $(".pic", $(this)).hide();
    });
    
    /*jQuery滚动到顶部插件*/
    $.scrollUp({scrollText:''});
    
    /*计数组件 */
    $('.icon-plus').parent().click(function(){
        var countInput = $(this).prev('input');
        countInput.val(parseInt(countInput.val()) + 1);
        countInput.change();
    });
    $('.icon-minus').parent().click(function(){ 
        var countInput = $(this).next('input');
        if(countInput.val() <= 1) return false;
        countInput.val(parseInt(countInput.val()) - 1);
        countInput.change();
    });
    $('input[name=amount]').change(function(){
    	var amount = parseInt($(this).val());
    	var price = parseFloat($(this).parents('tr').find('#price').text());
        var sum = (amount * price).toFixed(2);
        $(this).parents('tr').find('#sum').text(sum);
        countSum();
    });
    /*计算总数量及总价格*/
    function countSum(){
        var amount = 0;
        var price = 0;
        $('#cart-list>tr').each(function(){
          amount += parseInt($("#amount", $(this)).val());
          price = (parseFloat(price) + parseFloat($("#sum", $(this)).text())).toFixed(2);
        })
        $('#amount-sum').text(amount);
        $('#price-sum').text(price);
    }
    
    /**登录页面*/
    $("#wx-login").click(function(){
    	$("#qrcode_wx").toggle();
    });
    
    /*图片延迟加载 */
    if($.isFunction($.fn.lazyload)){  
      $("img.lazy").lazyload();
    }
});
