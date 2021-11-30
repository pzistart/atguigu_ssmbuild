
import com.atguigu.bean.Department;
import com.atguigu.dao.DepartmentMapper;
import com.atguigu.dao.EmployeeMapper;
import com.atguigu.service.DepartmentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Pzi
 * @create 2021-11-20 16:11
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Mtest {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private DepartmentService departmentService;

    @Test
    public void test1 (){
        List<Department> departments = departmentMapper.queryAll();
        for (Department d : departments){
            System.out.println(d);
        }
    }
/*
    @Test
    public void test2 (){
        int i = departmentMapper.addDept(new Department(null, "人事部"));
        System.out.println(i);
        List<Department> departments = departmentMapper.queryAll();
        for (Department d : departments){
            System.out.println(d);
        }
    }*/

    @Test
    public void test3 (){
        System.out.println(departmentMapper.deleteDeptById(3));
        List<Department> departments = departmentMapper.queryAll();
        for (Department d : departments){
            System.out.println(d);
        }
    }

    @Test
    public void test4 (){
        Department department = departmentMapper.queryById(1);
        System.out.println(department);
    }

    /*@Test
    public void test5 (){
        int i = departmentMapper.updateDept(new Department(2, "人事部"));
        System.out.println(i);
        List<Department> departments = departmentMapper.queryAll();
        for (Department d : departments){
            System.out.println(d);
        }
    }*/

    @Test
    public void testqueryDeptWithAllEmps (){
        Department department = departmentMapper.queryDeptWithAllEmps(1);
        System.out.println(department);
        System.out.println(department.getEmployees());
    }

    @Test
    public void queryAllDepts (){
        List<Department> departments = departmentService.queryAll();
        for(Department d : departments){
            System.out.println(d);
        }
    }

    @Test
    public void test (){
        String s = "a-b-c";
        String[] split = s.split("-");
        for (String str : split){
            System.out.println(str);
        }
    }

    @Test
    public void test2 (){
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        Integer[] objects = (Integer[]) list.toArray();
    }

    @Test
    public void deleteBat (){

    }

}
