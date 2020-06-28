<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.naming.Context" %><%--
  Created by IntelliJ IDEA.
  User: harryren
  Date: 2020/6/17
  Time: 09:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.bean.CarBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.MyCar" %>
<%--保证路径有效--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<%--弹窗提示--%>
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

<%--获取用户ID--%>
<%
    String username=(String) request.getAttribute("username");
    if (username==null)
        username=request.getParameter("username");
%>


<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.5.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>

    <title>商城主页</title>
</head>
<body>
<%--导航栏--%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Hi,<%=username%></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a >数码 <span class="sr-only">(current)</span></a></li>
                <li><a >家电</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">时尚单品 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a ></a></li>
                        <li><a >上衣</a></li>
                        <li><a >下衣</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a >鞋帽</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a >腕表</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" data-toggle="modal" data-target="#myModalCar" >我的购物车</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<%--商品列表--%>
<div class="row">
    <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
            <img src="img/ap1.png" alt="...">
            <div class="caption">
                <h3>iPhone 11</h3>
                <p>一切都刚刚好</p>
                <p>¥5299.00
                    <a href="#" class="btn btn-default" role="button" data-toggle="modal" data-target="#myModal1">详情</a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
            <img src="img/ap2.png" alt="...">
            <div class="caption">
                <h3>iPad Pro</h3>
                <p>下一台生产力设备何必是电脑</p>
                <p>¥6299.00
                    <a href="#" class="btn btn-default" role="button " data-toggle="modal" data-target="#myModal2">详情</a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
            <img src="img/ap3.png" alt="...">
            <div class="caption">
                <h3>Macbook Pro</h3>
                <p>科技的艺术品</p>
                <p>¥9999.00
                    <a href="#" class="btn btn-default" role="button" data-toggle="modal" data-target="#myModal3">详情</a>
                </p>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
            <img src="img/hw1.png" alt="...">
            <div class="caption">
                <h3>HUAWEU P40</h3>
                <p>5000万超感知徕卡五摄</p>
                <p>¥7988.00
                    <a href="#" class="btn btn-default" role="button" data-toggle="modal" data-target="#myModal4">详情</a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
            <img src="img/hw2.png" alt="...">
            <div class="caption">
                <h3>HUAWEI Mate Xs</h3>
                <p>折叠世界</p>
                <p>¥16999.00
                    <a href="#" class="btn btn-default" role="button " data-toggle="modal" data-target="#myModal5">详情</a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
            <img src="img/hw3.png" alt="...">
            <div class="caption">
                <h3>MateBook X Pro</h3>
                <p>3K触控全面屏</p>
                <p>¥9899.00
                    <a href="#" class="btn btn-default" role="button" data-toggle="modal" data-target="#myModal6">详情</a>
                </p>
            </div>
        </div>
    </div>
</div>

<%--商品1详情--%>
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    iPhone 11
                </h4>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/addcar?uname=<%=username%>&gname=iPhone 11" method="post">
                    <h2>一切都刚刚好。<input type="hidden" name="" value="iPhone 11"/></h2>
                    <p>全新双摄系统取景范围更大，可将你的所见所爱尽收画面之中。</p>
                    <p>iPhone 迄今最快的芯片和从早用到晚的电池续航，让你能做的事更多，却无需频频充电。</p>
                    <p>而有了 iPhone 最高的视频画质，你所记录的那些美好时分，也会更加鲜活。</p>
                    <h2>说真的，想拍失手还真不容易。</h2>
                    <h3>崭崭新的双摄系统。 让你不仅能拍广角的，更能拍超广角的照片。</h3>
                    <p>界面也经过重新设计，借助全新超广角摄像头的特性，你现在不仅能看到取景框外的画面，还能同时拍下来。</p>
                    <p>录制和剪辑视频，也变得像拍摄和编辑照片一样简单。这部早已深受人们喜爱的相机，现在，有了全然一新的视野。</p>
                    <h2>新一代的智能 HDR。</h2>
                    <p>借助机器学习技术，智能 HDR 变得比以往更聪明。</p>
                    <p>它可以识别照片中的人物，并能将其与照片中的其他部分区隔开来，分别进行处理。</p>
                    <p>因此，你将看到夕阳下的面孔有着优美的高光、阴影，肤色也格外自然，同时背景中迷人的落日余晖，依然分外绚丽。</p>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            加入购物车
                        </button>
                    </div>
                </form>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--商品2详情--%>
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    iPad Pro
                </h4>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/addcar?uname=<%=username%>&gname=iPad Pro" method="post">
                    <h2>你的下一台电脑， 何必是电脑。<input type="hidden" name="gname" value="iPad Pro"/></h2>
                    <p>它如同一片充满魔力的玻璃。
                        它快到让很多笔记本电脑都眼红。
                        它的Pro级摄像头打通了真实和虛拟的交界。
                        它能让你用手、用笔、用键盘，还有触控板来互动。
                        它，就是新款iPad Pro。</p>
                    <h2>先进的移动 设备显示屏。</h2>
                    <p>全面屏设计的Liquid视网膜屏1,
                    拥有ProMotion自适应刷新率和
                    原彩显示技术，让iPad Pro上的
                    一切都赏心悦目，互动灵敏。</p>
                    <h2>说真的，真是快到 让很多PC都眼红。</h2>
                    <p>有了A12Z仿生芯片，iPad Pro的
                    速度快到让很多笔记本电脑都羡慕。
                    澎湃动力，助你从容应对各种专业
                    工作和游戏。</p>
                    <h2>眼界更广了， 见识更深了。</h2>
                    <p>能拍摄气势磅礴的超广角
                    照片，还能凭借激光雷达
                    扫描仪让增强现实的
                        沉浸感更进一步。</p>
                    <p>这款先进的摄像头，与宽大显示屏、超快性能和精
                        密校准感应器的强强联合，为iPad赋予了非同寻
                        常的实力。广角摄像头和全新的超广角摄像头，助
                        你拍出画面精美的照片和视频，再加，上录音棚级的
                        麦克风和四扬声器系统，一套多镜头电影拍摄装备
                        尽在你手。</p>
                    <h2>有键盘，有触控板，为iPad两全其美。</h2>
                    <p>有了妙控键盘，用iPad Pro打字的感觉
                    更赞了，自带的触控板支持在iPadOS中
                    使用光标。同时，它还可以为机身前后
                    提供妥帖保护2。</p>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            加入购物车
                        </button>
                    </div>
                </form>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--商品3详情--%>
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel3">
                    Macbook Pro
                </h4>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/addcar?uname=<%=username%>&gname=Macbook Pro" method="post">
                    <h2>随身的实力派。<input type="hidden" name="gname" value="Macbook Pro"/></h2>
                    <p>MacBookPro再一次提升笔记本电脑的性能和便携性。它将高性能的处理器和内存、先进的图形处
                        理器、高速存储设备和众多强大配置，容纳于不足3斤的小巧机身中，助你加速实现心中创想，尽情
                        天马行空。</p>
                    <h2>动力澎湃，正是核心所在。</h2>
                    <p>13英寸MacBook Pro最高可选配第十代4核Intel Core i7处理器， 能够应对各种高难度任务。即使是编写代码、层叠
                    多条音轨或视频编码等高度专业的处理任务，你都能完成得更顺畅，更迅速。这次,13英寸MacBookPro更可选配32GB
                    内存，性能表现最高可提速50%之多。无论是在Photoshop中编辑十亿像素的大图2，载入更多虚拟乐器，还是运行多个虚
                        拟主机，你都能感受到异乎寻常的流畅。</p>
                    <h2>关键布局，全盘安排。<input type="hidden" name="gname" value="Macbook Pro"/></h2>
                    <p> 内置妙控键盘采用优化的1毫米键程剪刀式结构，带来灵敏舒适
                        又安静的输入体验:独立的Esc键，便于你快速切换各种模式和
                        视图;呈倒T形排列的方向键，让你轻松操控各类游戏和表格;
                        此外，触控栏会整理好各种实用的快捷键，为你放置在醒目的
                        居中位置:而触控ID则能助你快速完成身份验证。</p>
                    <h2>先进的端口，功能强大且用途广泛。</h2>
                    <p>雷雳3结合超高带宽以及USB-C行业标准的高度多用性，打造出一个
                    极速的通用端口。MacBook Pro最多可配备四个这样的端口，
                    让你在机身左右两边都可以充电、传输数据或输出视频。</p>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            加入购物车
                        </button>
                    </div>
                </form>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--商品4详情--%>
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel4">
                    HUAWEI P40
                </h4>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/addcar?uname=<%=username%>&gname=HUAWEI P40" method="post">
                    <h2>超感知影像。<input type="hidden" name="gname" value="HUAWEU P40"/></h2>
                    <p>HUAWEI P40 Pro+后置徕卡五摄，分别是5000万像素超感知摄像头、4000万像素
                        电影摄像头、800万像素超级变焦摄像头、800万像素长焦摄像头和3D深感摄像头。</p>
                    <h2>经典更摩登</h2>
                    <p>纳米微晶陶瓷工艺｜五天五夜高温煅烧</p>
                    <p> HUAWEI P40 Pro+机身采用了纳米级的微晶陶瓷材质。</p>
                    <h3>身未动，心已远</h3>
                    <p>超远距十倍光学变焦｜100倍双目数字变焦</p>
                    <p>HUAWEI P40 Pro+超级变焦摄像头等效焦段为240mm，10倍光学变焦为近似值</p>
                    <h2>低功耗，高能量</h2>
                    <p>麒麟990 5G SoC芯片|16核Mali-G76 GPU</p>
                    <p>5G双卡双膜全网通｜支持Wi-Fi6</p>
                    <h2>早晚相伴，游刃有余</h2>
                    <p>40W有线无线｜快充不再受限</p>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            加入购物车
                        </button>
                    </div>
                </form>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--商品5详情--%>
<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel5">
                    HUAWEI Mate Xs
                </h4>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/addcar?uname=<%=username%>&gname=HUAWEI Mate Xs" method="post">
                    <h2>科技新物种惊艳于世<input type="hidden" name="gname" value="HUAWEI Mate Xs"/></h2>
                    <p>全新折叠形态设计，带领未来科技革命
                        开，览宇宙苍穹，带来平板电脑般开阔视觉
                        合，敛艺术灵蕴，凝练智能手机科技之大成
                        自在变幻，风范尽显</p>
                    <h2> 灵巧坚韧180° 开合</h2>
                    <p> 创新柔性材质，鹰翼式折叠设计
                        百余器件紧密协同，呈现高效联动折叠
                        突破性技术与精密加工，造就紧密贴合之美
                        精雕细琢，开合随心，书写科技美学</p>
                    <h2> 纵横视界浑然天成</h2>
                    <p> 8英寸1全面屏，目光所及，豁然开朗
                        创新聚酰亚胺柔性材质，纤薄柔韧
                        毫厘间，尽藏不凡科技;柔性里，处处技高一筹</p>
                    <h2>精密机械匠心独具</h2>
                    <p>华为自研突破性铰链
                    以精密的机械设计，诠释优雅的折叠姿态
                        强韧牢靠，从容应对开合操作</p>
                    <h2>智慧分屏天生高效</h2>
                    <p>创新智慧分屏互动体验，多任务同时进行3
                    灵活分工亦可智慧协同，事半功倍
                    悬浮窗快速响应，效率变革，由此开启</p>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            加入购物车
                        </button>
                    </div>
                </form>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--商品6详情--%>
<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel6">
                    MateBook X Pro
                </h4>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/addcar?uname=<%=username%>&gname=MateBook X Pro" method="post">
                    <h2>3K炫丽全面屏<input type="hidden" name="gname" value="MateBook X Pro"/></h2>
                    <p>13.9英寸炫丽全面屏1，高达91 %的屏占比2，
                        配合
                        3K分辨率，
                        带来一览无余的清晰视野，100 %
                        sRGB(典型值)广色域，
                        对比度高达1500:13，
                        使画面栩栩如生，如同真实呈现; 3:2的屏幕比例，
                        在阅读和文档处理时可显示更多内容。</p>
                    <h2>可触摸的大视野</h2>
                    <p>低功耗L TPS显示屏，搭配康宁大猩猩玻璃、一体
                    化触控方案，实现高精度十点触控。更有三指下划
                    截屏，随手勾勒，截取任意形状，并自动识别图片
                        内文字，转换为文本，高效贴心。</p>
                    <h2>轻而易举|精湛工艺</h2>
                    <p>高端铝合金机身，CNC钻切工艺，
                    厚 度仅约14.6mm5，纤薄有型却不失稳
                    固，呈现独特金属美感。精密陶瓷喷
                    砂工艺， 带来温润细腻触感 仅约
                    1.33kg的轻薄重量，令旅途不再沉 重。</p>
                    <h2>多屏协同便捷互传</h2>
                    <p>轻碰连接后，华为MateBook与手机即可跨系统多屏
                    协同7，实时互动。电脑屏幕内可操作手机界面，享受
                    丰富的手机应用生态。文件图片双向拖拽互传;电脑
                    可接打电话;
                    键盘、鼠标化身手机外设，高效输入。
                    电脑手机优势互补，无缝衔接，
                    自然流转。</p>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            加入购物车
                        </button>
                    </div>
                </form>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--我的购物车--%>
<div class="modal fade" id="myModalCar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabelCar">
                    我的购物车
                </h4>
            </div>
            <div class="modal-body">
                <form>
                    <table class="table table-striped">
                        <tr>
                            <td>商品名称</td>
                            <td>商品单价</td>
                            <td>商品数量</td>
                            <td>商品总价</td>
                            <td>商品操作</td>
                        </tr>
                        <%
                            CarBean carBean=new CarBean();
                            List<MyCar> list=carBean.SelCar(username);
                            for (MyCar car:list) {
                        %>
                        <tr>
                        <td><%=car.getQname()%></td>
                        <td><%=car.getPrice()%></td>
                        <td><%=car.getQuantity()%></td>
                        <td><%=car.getPrice()*car.getQuantity()%></td>
<%--                        <td><input class="btn btn-danger" type="submit" value="删除"></td>--%>
                        <td><a href="delcar?gname=<%=car.getQname()%>&uname=<%=username%>" class="btn btn-danger">删除</a> </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                    </div>
                </form>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>