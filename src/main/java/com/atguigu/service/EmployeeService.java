package com.atguigu.service;

import com.atguigu.bean.Employee;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Pzi
 * @create 2021-11-20 20:03
 */
@Service
public interface EmployeeService {

    //    根据dId查询所有的Emps
    List<Employee> queryEmpsBydId(Integer id);

    List<Employee> queryAllEmps();

    //    根据id查询员工
    Employee queryEmpById(Integer id);

    int addEmp(Employee employee);

    int deleteEmpById(Integer id);

    int deleteEmpBatch(List<Integer> list);

    int updateEmp(Employee employee);

    Boolean haveEmp(String empName);
}
