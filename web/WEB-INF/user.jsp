<%-- 
    Document   : user
    Created on : 28-Oct-2021, 8:22:40 PM
    Author     : wenchi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
        <style>
            div.block_1{
                float:left;
                width:24%;
                background-color:powderblue;
                border: solid green;
                align:center;   
                align-items: center;
            }
            div.block_2{
                float:left;
                width:50%;
                background-color:powderblue;
                border: solid green;
                align-items: center;
            }
            .item{
                width: 96%;
                margin-top: 3px;
            }
        </style>
    </head>
    <body>
        <div class="block_1">
            <h2 style="text-align: center;">Add User</h2>
            <form action="users" method="post">
                <input type="text" class="item" name="email" placeholder="Email" required>
                <select class="item" name="active">
                    <option value="1">active</option>
                    <option value="0">inactive</option>
                </select>
                <input type="text" class="item" name="firstname" placeholder="First Name" required>
                <input type="text" class="item" name="lastname" placeholder="Last Name" required>
                <input type="text" class="item" name="password" placeholder="Password" required>
                <select class="item" name="role">
                    <option value="1">system admin</option>
                    <option value="2">regular user</option>
                    <option value="3">computer admin</option>
                </select>
                <input type="hidden" name="action" value="save">
                <input type="submit" class="item" value="Save">
            </form>
        </div>
        <div class="block_2">
            <h2 style="text-align: center;">Manage Users</h2>
                <table border="true" style="width:100%;font-size:9px">
                    <tr>
                    <th style="width:33%">Email</th>
                    <th sytle="widht:9%">Active</th>
                    <th style="width:12%">First Name</th>
                    <th style="width:12%">Last Name</th>
                    <th style="width:15%">Role</th>
                    <th style="width:8%">Edit</th>
                    <th style="width:8%">Delete</th>
                    </tr>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.email}</td>
                            <td><c:if test = "${user.active == 1}">active</c:if><c:if test = "${user.active == 0}">inactive</c:if></td>
                            <td>${user.first_name}</td><td>${user.last_name}</td>
                            <td>${roles[user.role-1].role_name}
                            <td><a href="/Lab7_ManageUser/users?action=edit&email=${user.email}">&#x270E;</a></td>
                            <td><a href="/Lab7_ManageUser/users?action=delete&email=${user.email}">&#10060;</a></td>
                              
                        </tr>
                        </c:forEach>
                </table>
            
        </div>
        <div class="block_1">
            <h2 style="text-align: center;">Edit</h2>
            <form action="users" method="post">
                <input type="text" class="item" name="email" placeholder="Email" required value=${edit_user.email}>
                <select class="item" name="active">
                    <option value="1" <c:if test = "${edit_user.active == 1}"> selected</c:if>>active</option>
                    <option value="0" <c:if test = "${edit_user.active == 0}"> selected</c:if>>inactive</option>
                </select>
                <input type="text" class="item" name="firstname" placeholder="First Name" required value=${edit_user.first_name}>
                <input type="text" class="item" name="lastname" placeholder="Last Name" required value=${edit_user.last_name}>
                <input type="text" class="item" name="password" placeholder="Password" required  value=${edit_user.password}>
                <select class="item" name="role" value="regular user">
                    <option value="1" <c:if test = "${edit_user.role == 1}"> selected</c:if>>${roles[0].role_name}</option>
                    <option value="2" <c:if test = "${edit_user.role == 2}"> selected</c:if>>${roles[1].role_name}</option>
                    <option value="3" <c:if test = "${edit_user.role == 3}"> selected</c:if>>${roles[2].role_name}</option>
                </select>
                <input type="hidden" name="action" value="saveedit">
                <input type="submit" class="item" value="Edit" <c:if test = "${edit_enable == null}">disabled</c:if>>
            </form>
            <form>
                <input type="hidden" name="action" value="cancel">
                <input type="submit" class="item" value="Cancel" <c:if test = "${edit_enable == null}">disabled</c:if> >
            </form>
        </div>
    </body>
</html>
