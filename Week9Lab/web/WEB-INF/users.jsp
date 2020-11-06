<%-- 
    Document   : users
    Created on : Oct 27, 2020, 10:43:27 AM
    Author     : 760483
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users Database</title>
        <link href="./stylesheet.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div class="background"/>
        <div class="full">
            <c:if test="${empty editUser}">
                <div class="box add">
                    <h1>Add User</h1>
                    <form method="post" action="user">
                        <input type="text" name="email" placeholder="E-Mail">
                        <br/>

                        <input type="text" name="firstName" placeholder="First Name">
                        <br/>

                        <input type="text" name="lastName" placeholder="Last Name">
                        <br/>

                        <input type="text" name="password" placeholder="Password">
                        <br/>
                        <select name="role">
                            <c:forEach items="${role}" var="read">    
                                <option value="${read.roleId}">${read.roleName}</option>
                            </c:forEach>
                        </select><br/>
                        <input type="hidden" name="action" value="add">
                        <input type="submit" value="Add User">
                    </form>
                </div>
            </c:if>
            <c:if test="${not empty editUser}">
                <div class="box add">
                    <h1>Edit User</h1>
                    <form method="post" action="user">
                        <input type="text" name="email" placeholder="E-Mail" value="${editUser.email}">
                        <br/>

                        <input type="text" name="firstName" placeholder="First Name" value="${editUser.firstName}">
                        <br/>

                        <input type="text" name="lastName" placeholder="Last Name" value="${editUser.lastName}">
                        <br/>

                        <input type="text" name="password" placeholder="Password" value="${editUser.password}">
                        <br/>
                        <select name="role">
                            <c:forEach items="${role}" var="read">    
                                <option value="${read.roleId}" <c:if test="${editUser.role.roleId eq read.roleId}">selected</c:if>>${read.roleName}</option>
                            </c:forEach>
                        </select><br/>
                        <input type="hidden" name="originalemail" value="${editUser.email}">
                        <input type="hidden" name="action" value="update">
                        <input type="submit" value="Update">
                        
                        <form method="post" action="user">
                            <input type="hidden" name="action" value="cancel">
                            <input type="submit" value="Cancel">
                        </form>
                    </form>
                    
                </div>
            </c:if>

            <div class="box manage">
                <h1>Manage User</h1>
                <table>
                    <tr>
                        <td><b><u>Email</u></b></td>
                        <td><b><u>First Name</u></b></td>
                        <td><b><u>Last Name</u></b></td>
                        <td><b><u>Role</u></b></td>
                        <td><b><u>Edit</u></b></td>
                        <td><b><u>Delete</u></b></td>
                    </tr>
                    <c:forEach items="${user}" var="read">
                        <tr>
                            <td>${read.email}</td>
                            <td>${read.firstName}</td>
                            <td>${read.lastName}</td>
                            <td>
                                <c:forEach items="${role}" var="readA">    
                                    <c:if test="${read.role.roleId eq readA.roleId}">${readA.roleName}</c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <form method="post" action="user">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="useremail" value="${read.email}">
                                    <button class="btnEdit" type="submit" value="Edit"></button>
                                </form>
                            </td>
                            <td>
                                <form method="post" action="user">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="useremail" value="${read.email}">
                                    <button class="btnDelete" type="submit" value="Delete"></button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

    </body>
</html>
