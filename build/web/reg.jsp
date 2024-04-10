<%-- 
    Document   : index
    Created on : 12 Oct, 2023, 2:35:12 PM
    Author     : khush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registration Form</h1>
        <form action="register" method="post" enctype="multipart/form-data">
             <label >Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label>Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label>Gender:</label><br>
        <input type="radio"  name="gender" value="male" required>
        <label>Male</label><br>
        <input type="radio"  name="gender" value="female" required>
        <label>Female</label><br>
        <input type="radio"  name="gender" value="other" required>
        <label>Other</label><br><br>
        
        <label >Mobile Number:</label>
        <input type="tel"  name="mobile_no" required><br><br>
        
        <label>Password:</label>
        <input type="password"  name="password" required><br><br>
        
       <label>Upload Profile Picture:</label>
        <input type="file"  name="file" required><br><br>
        
        <label for="bio">Bio:</label><br>
        <textarea id="bio" name="bio" rows="4" cols="50"></textarea><br><br>
        
        <label for="enrolment_no">Enrollment Number:</label>
        <input type="text" id="enrolment_no" name="enrolment_no"><br><br>
        
        <label>Department:</label>
        <select name="department" required>
            <option value="">Select Department</option>
            <option value="Computer Science">Computer Science</option>
            <option value="Electrical Engineering">Electrical Engineering</option>
            <option value="Mechanical Engineering">Mechanical Engineering</option>
            <!-- Add more options as needed -->
        </select><br><br>

        <label>Semester:</label>
        <select name="semester" required>
            <option value="">Select Semester</option>
            <option value="1st">1st</option>
            <option value="2nd">2nd</option>
            <option value="3rd">3rd</option>
            <!-- Add more options as needed -->
        </select><br><br>

        
            <input type="submit" value="Register">
        </form>
    </body>
</html>
