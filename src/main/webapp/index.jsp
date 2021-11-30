<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yyp
  Date: 2021/11/20
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工列表</title>
    <%--jQuery--%>
    <script src="/ssmbuild/static/js/jquery-3.6.0.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%--************标题************--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--************按钮************--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-success" id="add_emp_btn">新增</button>
            <button class="btn btn-danger" id="del_emp_btn">删除</button>
        </div>
    </div>

    <%--************表格数据************--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="checkAll"></th>
                    <th>#</th>
                    <th>lastName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <%--*****添加员工的模态框*****--%>
    <!-- Modal -->
    <div class="modal fade" id="emp_add_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName" class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" name="empName" class="form-control" id="empName"
                                       onblur="empNameBlur()"
                                       placeholder="empName">
                                <span id="empNameSpan" class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="email" name="email" class="form-control" id="email"
                                       onblur="emailBlur('#email')"
                                       placeholder="email@atguigu.com">
                                <span id="emailSpan" class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="gender" class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender_boy" value="男" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender_girl" value="女"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="gender" class="col-sm-2 control-label">department</label>
                            <div class="col-sm-4">
                                <select class="form-control" id="optionId" name="dId">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

    <%--*****修改员工的模态框*****--%>
    <div class="modal fade" id="emp_mod_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName" class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <p name="empName" class="form-control-static" id="empNameMod"></p>
                                <span id="empNameSpanMod" class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="email" name="email" class="form-control" id="emailMod"
                                       onblur="emailBlur('#emailMod')">
                                <span id="emailSpanMod" class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="gender" class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender_boy_mod" value="男" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender_girl_mod" value="女"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="gender" class="col-sm-2 control-label">department</label>
                            <div class="col-sm-4">
                                <select class="form-control" id="optionIdMod" name="dId">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_mod_btn">修改</button>
                </div>
            </div>
        </div>
    </div>


    <%--************分页条************--%>
    <div class="row">
        <div class="col-md-6" id="page_info_area">

        </div>

        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>

    <script type="text/javascript">
        var totalRecord, currentPage;
        //1、页面加载完成以后，直接去发送ajax请求,要到分页数据
        $(function () {
            //去首页
            to_page(1);
        });

        function to_page(pn) {
            $("#checkAll").prop("checked", false);
            $.ajax({
                url: "${pageContext.request.contextPath}/emps",
                data: "pn=" + pn,
                type: "GET",
                success: function (result) {
                    console.log(result);
                    //1、解析并显示员工数据
                    build_emps_table(result);
                    //2、解析并显示分页信息
                    build_page_info(result);
                    //3、解析显示分页条数据
                    build_page_nav(result);
                }
            });
        }

        function build_emps_table(result) {
            //清空table表格
            $("#emps_table tbody").empty();
            var emps = result.extend.pageInfo.list;
            $.each(emps, function (index, item) {
                var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender);
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                currentPage = result.extend.pageInfo.pageNum;
                /**
                 <button class="">
                 <span class="" aria-hidden="true"></span>
                 编辑
                 </button>
                 */
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //为编辑按钮添加一个自定义的属性，来表示当前员工id
                editBtn.attr("edit-id", item.empId);
                editBtn.attr("currentPage", currentPage);
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                //为删除按钮添加一个自定义的属性来表示当前删除的员工id
                delBtn.attr("del-id", item.empId);
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                //var delBtn =
                //append方法执行完成以后还是返回原来的元素
                $("<tr></tr>")
                    .append(checkBoxTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
            });
        }

        //解析显示分页信息
        function build_page_info(result) {
            $("#page_info_area").empty();
            $("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页,总" +
                result.extend.pageInfo.pages + "页,总" +
                result.extend.pageInfo.total + "条记录");
            totalRecord = result.extend.pageInfo.total;
        }

        //解析显示分页条，点击分页要能去下一页....
        function build_page_nav(result) {
            //page_nav_area
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");

            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if (result.extend.pageInfo.hasPreviousPage == false) {
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            } else {
                //为元素添加点击翻页的事件
                firstPageLi.click(function () {
                    to_page(1);
                });
                prePageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum - 1);
                });
            }


            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
            if (result.extend.pageInfo.hasNextPage == false) {
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            } else {
                nextPageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum + 1);
                });
                lastPageLi.click(function () {
                    to_page(result.extend.pageInfo.pages);
                });
            }


            //添加首页和前一页 的提示
            ul.append(firstPageLi).append(prePageLi);
            //1,2，3遍历给ul中添加页码提示
            $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if (result.extend.pageInfo.pageNum == item) {
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    to_page(item);
                });
                ul.append(numLi);
            });
            //添加下一页和末页 的提示
            ul.append(nextPageLi).append(lastPageLi);

            //把ul加入到nav
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }

        //  *******单击新增按钮弹出模态框
        $("#add_emp_btn").click(function () {
            //  将表单中的内容清除
            reset_form("#emp_add_model form");
            //  首先查出所有的部门信息
            queryAllDepts("#optionId");
            //  然后弹出模态框
            $("#emp_add_model").modal({
                backdrop: false
            })
        });

        //  ******清空表单的方法封装
        function reset_form(ele) {
            $(ele)[0].reset();
            $(ele).find("*").removeClass("has-success has-error");
            $(ele).find(".help-block").text("");
        }

        //  显示模态框中的所有部门信息
        function queryAllDepts(ele) {
            $.ajax({
                url: "${pageContext.request.contextPath}/depts",
                type: "GET",
                success: function (result) {
                    console.log(result);
                    to_option(result, ele);//
                }
            });
        }

        /*<select class="form-control">
            <option>1</option>
            <option>2</option>
            </select>*/
        //  将部门信息遍历出来并且拼串
        function to_option(result, ele) {
            $("#optionId").empty();
            var depts = result.extend.depts;
            //遍历 list 中的数据
            $.each(depts, function (index, item) {
                $("<option></option>").append(item.deptName).attr("value", item.deptId).appendTo($(ele));
            });
        }

        //显示校验结果的提示信息
        function show_validate_msg(ele, status, msg) {
            //清除当前元素的校验状态
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if ("success" == status) {
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            } else if ("error" == status) {
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        //  *******使用输入框onblur事件来判断
        function empNameBlur() {
            var empName = $("#empName").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            //  1.如果数据格式不符合，就显示格式不符合的错误信息
            if (!regName.test(empName)) {
                show_validate_msg("#empName", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
                return false;
            } else {
                show_validate_msg("#empName", "success", "");
                //  2.ajax请求，如果重名了，就显示重名的错误信息
                $.ajax({
                    url: "${pageContext.request.contextPath}/haveEmp",
                    data: {empName: $("#empName").val()},
                    method: "GET",
                    success: function (result) {
                        // console.log(result);
                        //  表示有同名的,那么就在调整class、span等标签,并且返回false
                        if (result.code == 100) {
                            show_validate_msg("#empName", "error", "该用户已存在，请重新输入~");
                            $("#emp_save_btn").attr("ajax-val", "error");
                        } else {
                            //  3.如果都没问题，就返回true
                            show_validate_msg("#empName", "success", "该用户名可用");
                            $("#emp_save_btn").attr("ajax-val", "success");
                        }
                    }
                });
                return true;
            }
        }


        function emailBlur(ele) {
            var email = $(ele).val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regEmail.test(email)) {
                show_validate_msg(ele, "error", "邮箱格式不正确");
                return false;
            } else {
                show_validate_msg(ele, "success", "");
                return true;
            }
        }

        //  ******新增操作；单击新增模态框中的保存按钮
        $("#emp_save_btn").click(function () {

            //  1.先验证输入的数据是否合法
            if (!empNameBlur() || !emailBlur('#email')) {// 如果函数返回假，说明输入框格式不符合
                return false;
            }

            //  2.使用保存按钮中的一个属性，验证用户名是否重复
            if ($("#emp_save_btn").attr("ajax-val") == "error") {
                return false;
            }


            //  2.再将数据保存到数据库
            $.ajax({
                url: "${pageContext.request.contextPath}/emp",
                method: "POST",
                data: $("#emp_add_model form").serialize(),
                success: function (result) {
                    console.log(result);
                    if (result.code == 100) {
                        console.log(result);
                        //  提示信息
                        alert(result.msg);
                        //  关闭模态框
                        $('#emp_add_model').modal('hide');
                        //  跳转到表最后一页，查看新添加的信息
                        to_page(totalRecord);
                    } else {
                        /*    alert(result.extend.errorMsg.empName);
                            alert(result.extend.errorMsg.email);*/
                        //  如果格式不正确，那么要将提示信息显示到span标签中，以及修改class样式
                        if (undefined != result.extend.errorMsg.empName) {
                            show_validate_msg("#empName", "error", "格式不符合，JSR303");
                        }

                        if (undefined != result.extend.errorMsg.email) {
                            show_validate_msg("#email", "error", "邮箱格式不正确,JSR303");
                        }

                        if (undefined != result.extend.errorMsg.duplicateName) {
                            console.log(result);
                            show_validate_msg("#empName", "error", "数据重复,JSR303");
                        }

                    }
                }
            });
        });

        //  ******删除操作
        $(document).on('click', ".delete_btn", function () {
            var delName = $(this).parents("tr").find("td:eq(1)").text();
            var delId = $(this).attr("del-id");
            if (confirm("是否确认删除" + "[" + delName + "]?")) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/emp/" + delId,
                    data: "_method=DELETE",
                    method: "POST",
                    success: function (result) {
                        alert("删除成功");
                        to_page(currentPage);
                    }
                });
            }
        });

        //  ******修改操作；单击编辑按钮
        $(document).on('click', ".edit_btn", function () {
            $("#optionIdMod").empty();
            //  加载部门信息
            queryAllDepts("#optionIdMod");
            //  1.根据empId查询其信息
            queryByempId($(this).attr("edit-id"));
            //  2.将empId给更新按钮
            $("#emp_mod_btn").attr("empid", $(this).attr("edit-id"));
            //  3.打开模态框
            $('#emp_mod_model').modal({
                backdrop: false
            })
        });

        //给全选框绑定单击事件
        $("#checkAll").click(function () {
            // $(".check_item").prop()
            $(".check_item").prop("checked", $(this).prop("checked"));
        });

        //为每个复选框绑定事件
        $(document).on("click", ".check_item", function () {
            $("#checkAll").prop("checked", $(".check_item:checked").length == $(".check_item").length);
        });

        //批量删除按钮
        $("#del_emp_btn").click(function () {
            //  获取待被删除用户的名字
            var checkedEmps = $(".check_item:checked").parents("tr").find("td:eq(2)");
            var empName = "";
            $.each(checkedEmps, function (index, item) {
                empName += $(this).text() + ",";
            });
            empName = empName.substring(0, empName.length - 1);

            //  获取待被删除用户的empId
            var checkedId = $(".check_item:checked").parents("tr").find("td:eq(1)");
            var empId = "";
            $.each(checkedId,function (index,item) {
                empId += $(this).text() + "-";
            })
            var empId = empId.substring(0,empId.length-1);
            // alert(empId);
            if (empId==""){
                alert("未选择用户！");
                return false;
            }

            // alert(empName);
            if (confirm("是否要删除[ " + empName + " ] ？")) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/emp/" + empId,
                    type: "DELETE",
                    success: function (result) {
                        alert("删除成功！");
                        to_page(currentPage);
                    }
                })
            }
        });

        function queryByempId(empId) {
            $.ajax({
                url: "${pageContext.request.contextPath}/emp/" + empId,
                type: "GET",
                success: function (result) {
                    console.log(result);
                    //  2.将信息回显到模态框的表单中
                    var emp = result.extend.employee;
                    $("#empNameMod").text(emp.empName);
                    $("#emailMod").val(emp.email);
                    $("#emp_mod_model input[name=gender]").val([emp.gender]);
                    $("#optionIdMod").val(emp.department.deptId);
                    //    $("#single").val("Single2");
                }
            });
        }

        $("#emp_mod_btn").click(function () {

            $.ajax({
                url: "${pageContext.request.contextPath}/emp/" + $(this).attr("empid"),
                data: $("#emp_mod_model form").serialize(),
                type: "PUT",
                success: function (result) {
                    console.log(result);
                    if (!emailBlur('#emailMod')) {
                        return false;
                    }
                    //加入后端校验，根据返回的json数据来决定前端数据显示
                    if (undefined != result.extend.msgMap.email) {
                        show_validate_msg("#emailMod", "error", "邮箱格式不正确,JSR303");
                        return false;
                    }

                    //    1.提示信息
                    alert("修改成功");
                    //    2.跳转到被修改的数据所在页面
                    to_page(currentPage);
                    //    3.关闭模态框
                    $("#emp_mod_model").modal('hide');

                }
            })
        });


        //清空表单样式及内容
        function reset_form(ele) {
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }

    </script>

</div>
</body>
</html>
