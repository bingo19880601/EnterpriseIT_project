<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>HW西安企业IT实施部管理系统</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    <%@ include file="/commons/basejs.jsp" %>
    <link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/login.css?v=201612202107" />
    <script type="text/javascript" src="${staticPath }/static/login.js?v=20170115" charset="utf-8"></script>
</head>
<body onkeydown="enterlogin();" style="text-align: center;">
	<div style="margin:0 auto;width:100%;">
	<div class="box-content" style="background-color:#3f51b5;height:680px;">
	    <div class="headerBar">
	        <span ng-click="fgtPwd()" class="fgtPwd btn"></span>
	        <span ng-click="adminEntrance()" class="adminEntrance btn" data-toggle="modal" data-target="#myModal"></span>
	    </div>
	    <div class="content">
	        <div class="title" >
	            <div ><h1 style="font-size:48px;margin-top:15px;">HW西安企业IT实施部管理系统</h1></div>
	            <div ><h4 style="font-size:22px;margin-top:15px;">HW Xi'an Enterprise IT Implementation Department Management System</h4></div>
	        </div>
	
	        <div style="background-color: #fff;
					    background:rgba(255, 255, 255, 0.3) none repeat scroll !important; 
					    background:#000; filter:Alpha(opacity=30);
					    background: rgb(255, 255, 255); 
					    margin: -100px auto auto; 
					    border: 1px solid rgb(231, 231, 231);
					    border-image:none;width:400px;
					    text-align: center;
					    margin-top: 150px;">
			    <form method="post" id="loginform">
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			        <P style="padding: 30px 0px 10px; position: relative;">
			            <span class="u_logo"></span>
			            <input class="ipt" id="username" type="text" name="username" placeholder="请输入登录名"/>
			        </P>
			        <P style="position: relative;">
			            <span class="p_logo"></span>
			            <input class="ipt" id="password" type="password" name="password" placeholder="请输入密码"/>
			        </P>
			        <P style="padding: 10px 0px 10px; position: relative;">
			            <input class="captcha" type="text" name="captcha" placeholder="请输入验证码"/>
			            <img id="captcha" alt="验证码" src="${path }/captcha.jpg" data-src="${path }/captcha.jpg?t=" style="vertical-align:middle;border-radius:4px;width:94.5px;height:35px;cursor:pointer;">
			        </P>
			        <P style="position: relative;text-align: left;">
			            <input class="rememberMe" type="checkbox" name="rememberMe" value="1" checked style="vertical-align:middle;margin-left:40px;height:20px;"/> 记住密码
			        </P>
			        <div style="height: 50px; line-height: 50px; margin-top: 10px;border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
			            <P style="margin: 0px 35px 20px 45px;">
			                <span style="float: left;">
			                    <!-- <a style="color: rgb(204, 204, 204);" href="javascript:;">忘记密码?</a> -->
			                </span>
			                <span style="float: right;">
			                    <!-- <a style="color: rgb(204, 204, 204); margin-right: 10px;" href="javascript:;">注册</a> -->
			                    <a style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;" href="javascript:;" onclick="submitForm()">登录</a>
			                </span>
			            </P>
			        </div>
			    </form>
		</div>
	    </div>
	</div>
	<div class="nav" style="margin-top:15px;">
	    <div>
	        <span style="color: gray;font-weight: bold;">竞标</span>
	        <br/>
	        <span>Bid</span>
	    </div>
	    <div>
	        <span style="color: gray;font-weight: bold;">招聘</span>
	        <br/>
	        <span>Recruitment</span>
	    </div>
	    <div>
	        <span style="color: gray;font-weight: bold;">项目</span>
	        <br/>
	        <span>Project</span>
	    </div>
	    <div>
	        <span style="color: gray;font-weight: bold;">人资</span>
	        <br/>
	        <span>Capital</span>
	    </div>
	    <div>
	        <span style="color: gray;font-weight: bold;">运营</span>
	        <br/>
	        <span>Operation</span>
	    </div>
	    <div>
	        <span style="color: gray;font-weight: bold;">数据分析</span>
	        <br/>
	        <span>Data Analysis</span>
	    </div>
	</div>
	<div class="footer">
	    <div class="helloDiv">Welcome to the system</div>
	    <div class="copyright">
	        <span style="font-size: 16px;">@2001-2017 版权所有 软通动力信息技术（集团）有限公司</span><br/>
	        <span>@2001-2017 All rights reserved iSoftStone Information Technology(Group)Limited</span>
	    </div>
	</div>
	</div>
</body>
</html>
