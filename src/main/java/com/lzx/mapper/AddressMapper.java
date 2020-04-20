package com.lzx.mapper;

import com.lzx.entity.Address;
import java.util.List;

import org.apache.ibatis.annotations.Param;
/**
 * address持久层接口
 * @author 51019
 *
 */
public interface AddressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(@Param("contact") String contact,@Param("mobile") String mobile,@Param("street") String street);

    Address selectByPrimaryKey(Integer id);

    List<Address> selectAll();

    int updateByPrimaryKey(Address record);
    //设置默认地址
    public void editValue(@Param("id") int id);
    //清楚默认值
    public void exclueValue(@Param("id") int id);
    
    public List<Address> selectByUser(Integer mbr_id);
    
}