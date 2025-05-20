<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.cart"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
    <link rel="stylesheet" href="css/styles1.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }

        .order-container {
            max-width: 90%;
            margin: 0 auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
            font-size: 16px;
        }

        td img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
        }

        .status {
            font-weight: bold;
            color: green;
        }

        .btn-group button {
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 5px;
        }

        .cancel-btn {
            background: #dc3545;
            color: white;
        }

        .track-btn {
            background: #007bff;
            color: white;
        }

    </style>
</head>

<body>

    <div class="order-container">
        <h1>My Orders</h1>

        <%
            List<cart> list = CartDao.getPaidOrder(u.getUid());
            if (list.size() > 0) {
        %>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Product Image</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Status</th>
            </tr>
            <%
                for (cart c : list) {
                    product p = ProductDao.getProduct(c.getPid());
            %>
            <tr>
                <td><%= c.getCid() %></td>
                <td><img src="product_img/<%= p.getProduct_img() %>" alt="<%= p.getProduct_name() %>"></td>
                <td><%= p.getProduct_name() %></td>
                <td>₹<%= p.getProduct_price() %></td>
                <td><%= c.getProduct_qty() %></td>
                <td>₹<%= c.getTotal_price() %></td>
                <td class="status">Paid</td>
                
            </tr>
            <%
                }
            %>
        </table>
        <%
            } else {
        %>
        <h2 style="text-align: center; color: #777;">No Orders Found</h2>
        <%
            }
        %>
    </div>

 

</body>
</html>
