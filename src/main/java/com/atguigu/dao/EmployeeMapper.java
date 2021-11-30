package com.atguigu.dao;

import com.atguigu.bean.Employee;
import jdk.internal.dynalink.linker.LinkerServices;

import java.util.List;

/**
 * @author Pzi
 * @create 2021-11-20 19:04
 */
public interface EmployeeMapper {

//    根据dId查询所有的Emps
    List<Employee> queryEmpsBydId(Integer id);

    List<Employee> queryAllEmps();

//    根据id查询员工
    Employee queryEmpById(Integer id);

    int addEmp(Employee employee);

    int deleteEmpById(Integer id);

    int deleteEmpBatch(List<Integer> list);


    int updateEmp(Employee employee);

    List<Employee> selectEmpByempName(String empName);

}
