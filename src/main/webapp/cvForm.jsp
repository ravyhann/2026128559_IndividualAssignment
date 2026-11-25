<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dynamic Online CV Builder</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="form-page">
    <div class="container form-card">
        <div class="top-bar">
            <div class="title-block">
                <h1>Dynamic Online CV<br>Builder</h1>
                <span class="accent-bar"></span>
            </div>
            <!-- HTTP GET trigger for Sample Template -->
            <a href="CVServlet?action=sample" class="btn btn-sample">Preview Sample CV</a>
        </div>

        <p class="form-subtitle">
            Fill in your details below to generate a printable CV. Fields marked with <span class="required">*</span> are mandatory.
        </p>

        <!-- HTTP POST Form Submission to CVServlet -->
        <form action="CVServlet" method="post">
            
            <h2 class="section-heading"><span class="section-dot"></span>Personal Information</h2>
            <div class="form-grid">
                <div class="form-group">
                    <label>Full Name <span class="required">*</span></label>
                    <input type="text" name="fullName" value="<c:out value="${sessionScope.cvData.fullName}"/>" placeholder="e.g. Nur Izzati binti Shahrulniza">
                </div>
                <div class="form-group">
                    <label>Professional Title</label>
                    <input type="text" name="title" value="<c:out value="${sessionScope.cvData.title}"/>" placeholder="e.g. Software Developer">
                </div>
                <div class="form-group">
                    <label>Email Address <span class="required">*</span></label>
                    <input type="text" name="email" value="<c:out value="${sessionScope.cvData.email}"/>" placeholder="e.g. izzati@example.com">
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" name="phone" value="<c:out value="${sessionScope.cvData.phone}"/>" placeholder="e.g. +60 12-345 6789">
                </div>
                <div class="form-group half-width">
                    <label>LinkedIn / GitHub URL</label>
                    <input type="text" name="link" value="<c:out value="${sessionScope.cvData.link}"/>" placeholder="e.g., https://github.com/username">
                </div>
                <div class="form-group half-width">
                    <label>Profile Summary</label>
                    <textarea name="summary" rows="3" placeholder="Brief overview of your career goals and background..."><c:out value="${sessionScope.cvData.summary}"/></textarea>
                </div>
            </div>

            <h2 class="section-heading"><span class="section-dot"></span>Education</h2>
            <div class="form-grid">
                <div class="form-group">
                    <label>Highest Degree <span class="required">*</span></label>
                    <input type="text" name="degree" value="<c:out value="${sessionScope.cvData.degree}"/>" placeholder="e.g. Bachelor of Computer Science (Hons.)">
                </div>
                <div class="form-group">
                    <label>Institution Name</label>
                    <input type="text" name="institution" value="<c:out value="${sessionScope.cvData.institution}"/>" placeholder="e.g. Universiti Teknologi MARA (UiTM)">
                </div>
                <div class="form-group">
                    <label>Year of Graduation</label>
                    <input type="text" name="gradYear" value="<c:out value="${sessionScope.cvData.gradYear}"/>" placeholder="e.g. 2026">
                </div>
                <div class="form-group">
                    <label>Major / Field of Study</label>
                    <input type="text" name="major" value="<c:out value="${sessionScope.cvData.major}"/>" placeholder="e.g. Computer Networks">
                </div>
            </div>

            <h2 class="section-heading"><span class="section-dot"></span>Work Experience</h2>
            <div class="form-grid">
                <div class="form-group">
                    <label>Most Recent Job Title</label>
                    <input type="text" name="jobTitle" value="<c:out value="${sessionScope.cvData.jobTitle}"/>" placeholder="e.g. Network Engineer Intern">
                </div>
                <div class="form-group">
                    <label>Company Name</label>
                    <input type="text" name="company" value="<c:out value="${sessionScope.cvData.company}"/>" placeholder="e.g. Kilac Computer Sdn. Bhd.">
                </div>
                <div class="form-group half-width">
                    <label>Duration</label>
                    <input type="text" name="duration" value="<c:out value="${sessionScope.cvData.duration}"/>" placeholder="e.g. Jan 2026 – June 2026">
                </div>
                <div class="form-group half-width">
                    <label>Key Responsibilities / Achievements</label>
                    <textarea name="responsibilities" rows="3" placeholder="Describe your main tasks and achievements..."><c:out value="${sessionScope.cvData.responsibilities}"/></textarea>
                </div>
            </div>

            <h2 class="section-heading"><span class="section-dot"></span>Skills</h2>
            <div class="form-grid">
                <div class="form-group">
                    <label>Technical Skills <span class="required">*</span></label>
                    <input type="text" name="technicalSkills" value="<c:out value="${sessionScope.cvData.technicalSkills}"/>" placeholder="e.g. Java, JSP, HTML, CSS, MySQL">
                </div>
                <div class="form-group">
                    <label>Soft Skills</label>
                    <input type="text" name="softSkills" value="<c:out value="${sessionScope.cvData.softSkills}"/>" placeholder="e.g. Teamwork, Communication, Leadership">
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-generate">Generate CV</button>
                <a href="CVServlet?action=clear" class="btn btn-clear">Clear Form</a>
            </div>
        </form>
    </div>
</body>
</html>
