<%-- 
    Document   : user
    Created on : 28-Oct-2021, 8:22:40 PM
    Author     : wenchi
--%>

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
            <form>
                <input type="text" class="item" name="email" placeholder="Email" >
                <input type="text" class="item" name="firstname" placeholder="First Name">
                <input type="text" class="item" name="lastname" placeholder="Last Name">
                <input type="text" class="item" name="password" placeholder="Password">
                <select class="item" name="role">
                    <option value="system admin">system admin</option>
                    <option value="regular user">regular user</option>
                    <option value="company admin">computer admin</option>
                </select>
                <input type="hidden" name="action" value="save">
                <input type="submit" class="item" value="Save">
            </form>
        </div>
        <div class="block_2">
            <h2 style="text-align: center;">Manage Users</h2>
            <form style="font-size:9px">
                <table border="true" style="width:100%">
                    <th style="width:33%">Email</th>
                    <th style="width:15%">First Name</th>
                    <th style="width:15%">Last Name</th>
                    <th style="width:20%">Role</th>
                    <th style="width:8%">Edit</th>
                    <th style="width:8%">Delete</th>
                </table>
            </form>
        </div>
        <div class="block_1">
            <h2 style="text-align: center;">Edit</h2>
            <form>
                <input type="text" class="item" name="email" placeholder="Email" >
                <input type="text" class="item" name="firstname" placeholder="First Name">
                <input type="text" class="item" name="lastname" placeholder="Last Name">
                <input type="text" class="item" name="password" placeholder="Password">
                <select class="item" name="role">
                    <option value="system admin">system admin</option>
                    <option value="regular user">regular user</option>
                    <option value="company admin">computer admin</option>
                </select>
                <input type="hidden" name="action" value="edit">
                <input type="submit" class="item" value="Edit">
            </form>
            <form>
                <input type="hidden" name="action" value="cancel">
                <input type="submit" class="item" value="Cancel">
            </form>
        </div>
    </body>
</html>
