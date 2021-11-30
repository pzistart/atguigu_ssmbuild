
import com.atguigu.bean.Department;
import com.atguigu.bean.Employee;
import com.atguigu.dao.DepartmentMapper;
import com.atguigu.dao.EmployeeMapper;
import com.atguigu.service.DepartmentService;
import com.atguigu.service.EmployeeService;
import lombok.ToString;
import net.sf.jsqlparser.statement.select.First;
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
public class EmpTest {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    private EmployeeService employeeService;


    @Test
    public void test1() {
        List<Employee> employees = employeeMapper.queryEmpsBydId(1);
        for (Employee e : employees) {
            System.out.println(e);
        }
    }

    @Test
    public void test2() {
//       int i = employeeMapper.addEmp(new Employee(null, "李彦宏", "男", "lyh@bd.com", new Department(1, null, null)));
//       System.out.println(i);
    }

    @Test
    public void test3() {
        int i = employeeMapper.deleteEmpById(5);
        System.out.println(i);
        List<Employee> employees = employeeMapper.queryAllEmps();
        for (Employee e : employees) {
            System.out.println(e);
        }
    }

    @Test
    public void test4() {
        Employee employee = employeeMapper.queryEmpById(1);
        System.out.println(employee);
        System.out.println(employee.getDepartment());
    }

    @Test
    public void test5() {
        List<Employee> employees = employeeMapper.queryAllEmps();
        for (Employee e : employees) {
            System.out.println(e);
        }
    }

  /* @Test

    public void testUpdateEmpById (){
       int i = employeeMapper.updateEmp(new Employee(8, "Tom", "女", null, new Department(2,null,null)));
       System.out.println(i);
       List<Employee> employees = employeeMapper.queryAllEmps();
       for (Employee e : employees){
           System.out.println(e);
       }*/


    @Test
    public void queryEmployeeById() {
        Employee employee = employeeMapper.queryEmpById(1);
        System.out.println(employee);
        System.out.println(employee.getDepartment());
    }

    @Test
    public void queryAllEmps() {
        List<Employee> employees = employeeMapper.queryAllEmps();
        for (Employee e : employees) {
            System.out.println(e);
        }

    }

    @Test
    public void addEmp() {
        int i = employeeMapper.addEmp(new Employee(null, "马总", "男", "mz@qq.com", 3, null));
        System.out.println(i);
    }

    @Test
    public void haveEmp() {
        Boolean haveEmp = employeeService.haveEmp("马云");
        System.out.println(haveEmp);
    }

    @Test
    public void queryByempId() {
        Employee employee = employeeMapper.queryEmpById(1);
        System.out.println(employee);
    }

    @Test
    public void deleteBat() {
   /*     List<Integer> list = new ArrayList<>();
        list.add(30);
        list.add(31);
        list.add(32);
        System.out.println(employeeMapper.deleteEmpBatch(list));
*/
        String s = "a-b-c";
        String[] split = s.split("-");
        for (int i = 0; i < split.length; i++){
            System.out.println(split[i]);
        }
        System.out.println(split.length);
    }

}







