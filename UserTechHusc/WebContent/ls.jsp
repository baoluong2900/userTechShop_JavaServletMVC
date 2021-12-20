<%@page import="bean.Cart"%>
<%@page import="bo.CartBo"%>
<%@page import="bean.Customer"%>
<%@page import="bean.Category"%>
<%@page import="bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.ProductBo"%>
<%@page import="bo.CategoryBo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Tech HUSC shop</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav">
      <li class="active"><a href="HtSach">Trang chủ</a></li>
      <li><a href="htgioController">Giỏ hàng</a></li>
      <li><a href="#">Thanh toán</a></li>
      <li><a href="PurchaseHistoryController">Lịch sử </a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
		<%
		Customer kh=(Customer)session.getAttribute("dn");
				if(kh!=null){
		%>
		 <li><a href="#">Xin chao: <%=kh.getName()%> </a></li>
		 <li><a href="dangxuatController"><span class="glyphicon glyphicon-user"></span> Đăng Xuất</a></li>
           <%
           }else{
           %>
           <li><a href="dangky.jsp"><span class="glyphicon glyphicon-user"></span>Đăng ký </a></li>
<li><a href="#" data-toggle="modal" data-target="#myModal">
           <span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
              <%
              if(session.getAttribute("kt")!=null && session.getAttribute("kt").toString().equals("0")){
              %>
             		 <script>alert('Dang nhap sai');</script>
              <%
              }
              %>
           <%
           }
           %>
    </ul>
  </div>
</nav>
<!-- Button Đăng nhập -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
 <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng nhập hệ thống</h4>
        </div>
        <div class="modal-body">
  				<form action="ktdnController" method="post">
 				<label>Tài khoản</label><br>
  				<input type="text" id="user" name="TenDN"><br>
  				<label>Mật khẩu</label><br>
  				<input type="passWord" id="pw" name="Matkhau"><br>
  				<input name="btlog" value="Đăng nhập" type="submit">
				</form>
  			</div>
      </div>
    </div>
 </div>
 <%
 response.setCharacterEncoding("utf-8");
    	request.setCharacterEncoding("utf-8");
    	ArrayList<Category> dsloai =(ArrayList<Category>)request.getAttribute("dsloai");
        ArrayList<Product> ds=(ArrayList<Product>)request.getAttribute("dssach");
 %>
 <table width="1000" align="center">
    
    <tr> 
       <td valign="top" width="200">
       		<table class="table table-hover">
       		<%
       		for(Category loai:dsloai){
       		%>
       			<tr>
       			<td>
        		<a href="HtSach?ml=<%=loai.getCategoryId()%>&find="<%=request.getParameter("txtfind")%>> <%=loai.getName()%>  </a>
        		</td>
        		</tr>
            <%
            }
            %> 
       		</table>
        </td>
        <td valign="top" width="600"> 
        
        	<table class="table table-hover">
			             			<tr>
			          <th>Mã đơn hàng</th>
			          <th>Tổng tiềnI</th>
			          <th>Mã khách hàng</th>
			          <th>Ngày đặt</th>
			          <th>Trạng tháit</th>
			       </tr>
			       <c:forEach items="${dsloai1}" var="tempType" >
			          <tr>
			    			   
						  	<td>${tempType.orderid}</td> 
						  	<td>${tempType.amount}</td>
						   	<td>${tempType.customerid}</td>
						    <td>${tempType.orderdate}</td>
							<td>${tempType.status}</td> 
			             <td>
			              
			             </td>
			          </tr> 
			       </c:forEach>
			</table>
	
   <div>

	<a href="HtSach"><button class="btn">Tiếp tục mua hàng</button></a>
	<a href="datmuaController"><button class="btn btn-success">Xác nhận đặt mua</button></a>
</div> 
	 <td valign="top" width="200"> 
        <form action="htgio.jsp" method="post">
        <label> Tìm kiếm: </label> <br>
        <input name="txtfind" type="text" class="form-control">
        <input name="but" type="submit" value="Tìm kiếm" class="btn-primary">
        	</form>
        </td>
</table>

</body>
</html>
