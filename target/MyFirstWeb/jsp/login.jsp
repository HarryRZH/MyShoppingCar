<%--
  Created by IntelliJ IDEA.
  User: harryren
  Date: 2020/6/16
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="zh-CN">
<%
    String message=(String)session.getAttribute("message");
    if (message!=null){
%>
<script type="text/javascript">
    alert("<%=message%>")
</script>
<%
    }
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-3.5.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="../style/login.css">
    <title>用户登陆</title>
</head>
<body>
<div class="container">
    <form action="<%=request.getContextPath()%>/login.do" method="post">
        <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 class="form-title">LOGIN</h3>
                <div class="col-md-9">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Username" id="username"
                               name="username" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <input class="form-control required" type="password" placeholder="Password" id="password"
                               name="password" maxlength="16"/>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="button" class="btn btn-info" name="register"
                                data-toggle="modal" data-target="#myModal">注册</button>
                        <button type="button" class="btn btn-primary" name="register"
                                data-toggle="modal" data-target="#myModal1">忘记密码</button>
                        <button type="submit" class="btn btn-success pull-right" name="submit">登录</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- 注册模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    用户注册
                </h4>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/register.do" method="post">
                    <div class="form-group">
                        <label  class="control-label">用户名:</label>
                        <input class="form-control required" type="text" placeholder="Username" id="rname"
                               name="rname" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                        <label  class="control-label">密码:</label>
                        <input class="form-control required" type="password" placeholder="Password" id="rpwd"
                               name="rpwd" maxlength="16"/>
                    </div>
                    <div class="form-group">
                        <label  class="control-label">确认密码:</label>
                        <input class="form-control required" type="password" placeholder="Password" id="rpwd2"
                               name="rpwd2" maxlength="16"/>
                    </div>
                    <div class="form-group">
                        <label  class="control-label">邮件地址:</label>
                        <input class="form-control required" type="text" placeholder="email" id="email"
                               name="email" maxlength="16"/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            提交更改
                        </button>
                    </div>
                </form>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 忘记密码模态框（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    找回密码
                </h4>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/findpwd.do" method="post">
                    <div class="form-group">
                        <label  class="control-label">用户名:</label>
                        <input class="form-control required" type="text" placeholder="Username" id="findname"
                               name="findname" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                        <label  class="control-label">邮件地址:</label>
                        <input class="form-control required" type="text" placeholder="email" id="findemail"
                               name="findemail" maxlength="16"/>
                    </div>
                    <div class="form-group">
                        <label  class="control-label">密码:</label>
                        <input class="form-control required" type="password" placeholder="Password" id="findpwd"
                               name="findpwd" maxlength="16"/>
                    </div>
                    <div class="form-group">
                        <label  class="control-label">确认密码:</label>
                        <input class="form-control required" type="password" placeholder="Password" id="findpwd2"
                               name="findpwd2" maxlength="16"/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            提交更改
                        </button>
                    </div>
                </form>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
