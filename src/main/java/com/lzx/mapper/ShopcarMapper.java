package com.lzx.mapper;

import com.lzx.entity.Shopcar;
import java.util.List;

import org.apache.ibatis.annotations.Param;
/**
 * 购物车mapper层接口
 * @author 51019
 *
 */
public interface ShopcarMapper {
	int deleteByPrimaryKey(Integer id);

    int insert(Shopcar record);

    Shopcar selectByPrimaryKey(Integer id);

    List<Shopcar> selectAll();

    int updateByPrimaryKey(Shopcar record);
    
    List<Shopcar> selectByMember(Integer member_id);
    
    Shopcar selectOne(@Param("member_id")int member_id, @Param("product_id")int product_id);
    
    int deleteByInfo(@Param("member_id")int member_id, @Param("product_id")int product_id);
}