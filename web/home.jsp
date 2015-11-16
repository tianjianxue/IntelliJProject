<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="util.NetWork" %>
<%@ page import="net.sf.json.JSONObject" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/16
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String code=request.getParameter("code");
  NetWork work=new NetWork();
  String json=work.getOath2(code);
  System.out.print(json);
  JSONObject obj=JSONObject.fromObject(json);
  String access_token= obj.getString("access_token");
  String openid= obj.getString("openid");
  out.print("您的OPENID:"+openid+"<hr/>");
  String url="https://api.weixin.qq.com/sns/userinfo?access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
  String userinfo=work.sendByGet(url);
  out.print(userinfo);

%>
</body>
</html>
