package com.atguigu.dao;

import com.atguigu.bean.Department;
import com.atguigu.bean.Employee;
import org.omg.CORBA.INTERNAL;

import java.util.List;

/**
 * @author Pzi
 * @create 2021-11-20 16:59
 */
public interface DepartmentMapper {

//    查询所有dept
    List<Department> queryAll();

//    根据id查询dept
    Department queryById(Integer id);

//    增加dept
    int addDept(Department department);

//    根据id删除dept
    int deleteDeptById(Integer id);

//    修改dept
    int updateDept(Department department);

//    查询这个部门中所有的员工
    Department queryDeptWithAllEmps(Integer id);


}
