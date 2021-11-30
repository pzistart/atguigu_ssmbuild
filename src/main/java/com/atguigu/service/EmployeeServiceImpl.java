package com.atguigu.service;

import com.atguigu.bean.Employee;
import com.atguigu.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Pzi
 * @create 2021-11-20 20:03
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    public List<Employee> queryEmpsBydId(Integer id) {
        return employeeMapper.queryEmpsBydId(id);
    }

    public List<Employee> queryAllEmps() {
        return employeeMapper.queryAllEmps();
    }

    public Employee queryEmpById(Integer id) {
        return employeeMapper.queryEmpById(id);
    }

    public int addEmp(Employee employee) {
        return employeeMapper.addEmp(employee);
    }

    public int deleteEmpById(Integer id) {
        return employeeMapper.deleteEmpById(id);
    }

    @Override
    public int deleteEmpBatch(List<Integer> list) {
        return employeeMapper.deleteEmpBatch(list);
    }

    public int updateEmp(Employee employee) {
        return employeeMapper.updateEmp(employee);
    }

    /**
     * 如果该名字存在employee，返回true
     *
     * @param empName
     * @return
     */
    public Boolean haveEmp(String empName) {
        List<Employee> employees = employeeMapper.selectEmpByempName(empName);
        if (employees.isEmpty()){// 如果集合中是空元素，haveEmp就返回false，代表该名字没有重复
            return false;
        }else {
            return true;
        }
    }
}
