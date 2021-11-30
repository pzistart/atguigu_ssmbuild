package com.atguigu.service;

import com.atguigu.bean.Department;
import com.atguigu.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Pzi
 * @create 2021-11-22 11:13
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper deptMapper;

    public List<Department> queryAll() {
        return deptMapper.queryAll();
    }

    public Department queryById(Integer id) {
        return deptMapper.queryById(id);
    }

    public int addDept(Department department) {
        return deptMapper.addDept(department);
    }

    public int deleteDeptById(Integer id) {
        return deptMapper.deleteDeptById(id);
    }

    public int updateDept(Department department) {
        return deptMapper.updateDept(department);
    }

    public Department queryDeptWithAllEmps(Integer id) {
        return deptMapper.queryDeptWithAllEmps(id);
    }
}
