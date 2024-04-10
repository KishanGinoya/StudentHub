<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>File Upload</title>
</head>
<body>
    <form action="FileUploadServlet" method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <input type="submit" value="Upload File">
    </form>
</body>
</html>
