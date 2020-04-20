package com.lzx.mapper;

import java.util.List;

import com.lzx.entity.Product;

public interface ProductMapper {
	int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    Product selectByPrimaryKey(Integer id);
    /**
     * 	查找全部数据
     * @return
     */
    List<Product> selectAll();
    
    int updateByPrimaryKey(Product record);
    /**
     * 	根据商品类型查找
     * @param cate_id
     * @return
     */
    List<Product> selectByCateId(Integer... cate_id);
    /**
     *	 查找最热门前五产品
     * @return
     */
    List<Product> selectPopular();
    
    List<Product> selectForSearch(String words);
}