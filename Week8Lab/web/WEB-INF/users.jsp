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
    </head>
    <body>

        <c:if test="${editUser ne true}">
        <div>
            <h1>Add User</h1>
            <form>
                <input type="text" name="emailInput" placeholder="E-Mail">
                <br/>

                <input type="text" name="firstNameInput" placeholder="First Name">
                <br/>

                <input type="text" name="lastNameInput" placeholder="Last Name">
                <br/>

                <input type="text" name="passwordInput" placeholder="Password">
                <br/>
                <select name="roleInput"><option value="regular user" selected="selected">Regular User</option>

                    <option value="system admin">System Administrator</option>

                    <option value="company admin">Company Administrator</option>
                </select><br/>
                <input type="submit" value="Add User">
            </form>
        </div>
        </c:if>
        <c:if test="${editUser eq true}">
            <div>
            <h1>Edit User</h1>
            <form>
                <input type="text" name="emailInput" placeholder="E-Mail" value="${editUser.email}">
                <br/>

                <input type="text" name="firstNameInput" placeholder="First Name" value="${editUser.firstName}">
                <br/>

                <input type="text" name="lastNameInput" placeholder="Last Name" value="${editUser.lastName}">
                <br/>

                <input type="text" name="passwordInput" placeholder="Password" value="${editUser.password}">
                <br/>
                <select name="roleInput">
                    <option value="regular user">Regular User</option>

                    <option value="system admin">System Administrator</option>

                    <option value="company admin">Company Administrator</option>
                </select><br/>
                <input type="submit" value="Update">
            </form>
        </div>
        </c:if>

        <div>
            <h1>Manage User</h1>
            <table>
                
                <c:forEach items="${user}" var="read">
                    <tr>
                        <td>${read.email}</td>
                        <td>${read.firstName}</td>
                        <td>${read.lastName}</td>
                        <td>${read.role}</td>
                        
                    <a href="users?editUser=true">Edit</a>
                    </tr>    
                </c:forEach>
            </table>
        </div>

        
    </body>
</html>
