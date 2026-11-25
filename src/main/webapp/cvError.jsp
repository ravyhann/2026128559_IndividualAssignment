<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Validation Error - CV Builder</title>
    <link rel="stylesheet" href="css/style.css">
    <!-- Warning message theme: Lavender and Yellow -->
    <style>
        body {
            background-color: #f6f3fc;
        }
        .container {
            max-width: 560px;
            margin: 60px auto;
            background: #ffffff;
            border-top: 6px solid #9470CE;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(148, 112, 206, 0.16);
            padding: 32px;
        }
        .container h1 {
            color: #6b46a8;
            border-bottom: 2px solid #ebe3f9;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .error-box {
            background-color: #fef2f2;
            border: 1px solid #fecaca;
            border-left: 5px solid #dc2626;
            color: #b91c1c;
            padding: 16px 18px;
            border-radius: 8px;
            margin-bottom: 24px;
        }
        .btn-return {
            display: inline-block;
            background-color: #F4E064;
            color: #2d2342;
            font-weight: 600;
            text-decoration: none;
            padding: 11px 22px;
            border-radius: 8px;
            border: 1px solid #EFCF20;
            transition: background-color 0.2s ease;
        }
        .btn-return:hover {
            background-color: #EFCF20;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Submission Error</h1>
        
        <!--Error message set by CVServlet  -->
        <div class="error-box">
            <strong>Unable to generate CV:</strong>
            <p style="margin-top: 8px; margin-bottom: 0;">${errorMsg}</p>
        </div>
        
        <!-- Link back to the form. The saved details are re-filled -->
        <a href="cvForm.jsp" class="btn btn-return">&larr; Return to CV Form</a>
    </div>
</body>
</html>