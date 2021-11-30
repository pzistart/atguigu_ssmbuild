package com.atguigu.controller;

import com.atguigu.bean.Department;
import com.atguigu.bean.Employee;
import com.atguigu.bean.Msg;
import com.atguigu.service.DepartmentService;
import com.atguigu.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Pzi
 * @create 2021-11-20 21:08
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/emps")
    @ResponseBody
    public Msg emps(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        //  从第几页开始查，页面有几条数据
        PageHelper.startPage(pn, 5);
        List<Employee> employees = employeeService.queryAllEmps();
        //  page:这里面包含了详细的信息，包含查询出来的数据
        PageInfo page = new PageInfo(employees, 5);//表示导航栏显示的页数
        return Msg.success().add("pageInfo", page);
    }


    //    ******保存新建用户数据
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    //  后端再来两次验证，根据JSR303的验证结果决定是否将数据添加到数据库
    //  并将成败信息返回到前端result
    public Msg empSave(@Valid Employee employee, BindingResult result) {
        System.out.println("进入了保存操作");
        //  1.验证格式
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<String, Object>();
            //  获取所有错误的信息
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError e : fieldErrors) {
                System.out.println("错误的字段名" + e.getField());
                System.out.println("错误的信息" + e.getDefaultMessage());
                map.put(e.getField(), e.getDefaultMessage());
            }
            return Msg.fail().add("errorMsg", map);
            //  2.验证数据是否重复
        } else if (employeeService.haveEmp(employee.getEmpName())) {    //  如果返回true，表示存在该名字的用户
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("duplicateName", "数据重复");
            return Msg.fail().add("errorMsg", map);
        } else {
            //  校验都通过，则保存数据
            System.out.println(employee);
            employeeService.addEmp(employee);
            return Msg.success();
        }
    }

    //    ******根据empId查询用户
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.GET)
    @ResponseBody
    public Msg empId(@PathVariable("empId") Integer empId) {
        Employee employee = employeeService.queryEmpById(empId);
        return Msg.success().add("employee", employee);
    }

    //    ******修改用户信息
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(@PathVariable("empId") Integer empId, @Valid Employee employee, BindingResult result) {
        System.out.println("进入了修改方法");
        Map<String, Object> msgMap = new HashMap<String, Object>();
        if (result.hasErrors()) {
            //  获取所有错误的信息
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError e : fieldErrors) {
                System.out.println("错误的字段名" + e.getField());
                System.out.println("错误的信息" + e.getDefaultMessage());
                msgMap.put(e.getField(), e.getDefaultMessage());
            }
            return Msg.fail().add("msgMap",msgMap);
        } else {
            System.out.println("封装后的对象是：");
            System.out.println(employee);
            employeeService.updateEmp(employee);
            return Msg.success().add("msgMap",msgMap);
        }
    }

    @RequestMapping(value = "/emp/{delId}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("delId") String delId){
        if (delId.contains("-")){
            // 1-2-3
            String[] id_str = delId.split("-");
            for (int i = 0; i < id_str.length; i++){
                int id_int = Integer.parseInt(id_str[i]);
                employeeService.deleteEmpById(id_int);
            }
        }else {
            int id = Integer.parseInt(delId);
            employeeService.deleteEmpById(id);
        }
        return Msg.success();
    }

    //    ******根据名字查询是否同名
    @RequestMapping("/haveEmp")
    @ResponseBody
    public Msg haveEmp(String empName) {
        System.out.println("进入了haveEmp()");
        System.out.println(empName);
        Boolean haveEmp = employeeService.haveEmp(empName);
        //  返回true，表示已经含有该成员
        if (haveEmp == true) {
            //  如果查到了，state=100
            return Msg.success();
        } else {
            //  如果没查到，state=200
            return Msg.fail();
        }
    }


 /*   @RequestMapping("/emps")
    public String emps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        // 从第几页开始查，页面有几条数据
        PageHelper.startPage(pn,5);
        List<Employee> employees = employeeService.queryAllEmps();
        //  这里面包含了详细的信息，包含查询出来的数据
        PageInfo page = new PageInfo(employees,5);//表示导航栏显示的页数
        model.addAttribute("pageInfo",page);
        return "list";
    }*/

    @ResponseBody
    @RequestMapping("employee")
    public Employee employee() {
        Employee employee = new Employee(1, "aaa", "1", "111", 1, new Department(1, "1aa"));
        return employee;
    }


}
