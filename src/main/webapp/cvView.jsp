<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${cvData.fullName} - Curriculum Vitae</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="form-page">
    <div class="container cv-page">
        <!-- Action buttons hidden when printing -->
        <div class="no-print" style="display: flex; justify-content: space-between; margin-bottom: 20px;">
            <a href="cvForm.jsp" class="btn btn-clear">&larr; Back to Form</a>
            <button onclick="window.print()" class="btn btn-sample">Print / Save as PDF</button>
        </div>

        <!-- CV Header -->
        <div class="cv-header">
            <h1>${cvData.fullName}</h1>
            <div class="cv-title">${cvData.title}</div>
            <div class="cv-contact">
                ${cvData.email}
                ${not empty cvData.phone ? ' | ' : ''}${cvData.phone}
                ${not empty cvData.link ? ' | ' : ''}${cvData.link}
            </div>
        </div>

        <!-- Profile Summary -->
        <div class="cv-section">
            <h2>Profile Summary</h2>
            <p>${cvData.summary}</p>
        </div>

        <!-- Education -->
        <div class="cv-section">
            <h2>Education</h2>
            <div class="item-header">
                <span>${cvData.degree} ${not empty cvData.major ? '(' : ''}${cvData.major}${not empty cvData.major ? ')' : ''}</span>
                <span>${cvData.gradYear}</span>
            </div>
            <div class="item-sub">${cvData.institution}</div>
        </div>

        <!-- Experience -->
        <div class="cv-section">
            <h2>Experience</h2>
            <div class="item-header">
                <span>${cvData.jobTitle}</span>
                <span>${cvData.duration}</span>
            </div>
            <div class="item-sub">${cvData.company}</div>
            <p>${cvData.responsibilities}</p>
        </div>

        <!-- Skills -->
        <div class="cv-section">
            <h2>Skills</h2>
            <p><strong>Technical Skills:</strong> ${cvData.technicalSkills}</p>
            <p style="margin-top: 6px;"><strong>Soft Skills:</strong> ${cvData.softSkills}</p>
        </div>
    </div>
</body>
</html>