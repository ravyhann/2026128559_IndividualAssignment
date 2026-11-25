package com.cvbuilder.controller;

import com.cvbuilder.model.CVBean;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CVServlet extends HttpServlet { 

    // Handles HTTP GET requests (e.g., clicking "Preview Sample CV")
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");

        // "Clear Form" wipes the saved form data, then shows an empty form
        if ("clear".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.removeAttribute("cvData");
            }
            response.sendRedirect("cvForm.jsp");
            return;
        }

        if ("sample".equals(action)) {
            // Create and populate a CVBean with realistic sample data
            CVBean sampleBean = new CVBean();
            sampleBean.setFullName("Ahmad Rayhan Bin Muhd Rizky");
            sampleBean.setTitle("Junior Software Engineer");
            sampleBean.setEmail("AhmadRayhan@example.com");
            sampleBean.setPhone("+60 13-266 1926");
            sampleBean.setLink("https://github.com/rayhan-dev");
            sampleBean.setSummary("Motivated Computer Science graduate skilled in Java, React, and database design. Successfully designed and deployed a Cookies Order System for my final-year project, improving process efficiency and gaining practical experience in agile workflows. Seeking a junior data analyst role to gain experience .");

            sampleBean.setDegree("Bachelor of Computer Science (Hons.)");
            sampleBean.setInstitution("Universiti Teknologi MARA (UiTM)");
            sampleBean.setGradYear("2026");
            sampleBean.setMajor("Software Engineering");

            sampleBean.setJobTitle("Software Developer Intern");
            sampleBean.setCompany("Hydro Solutions Sdn. Bhd.");
            sampleBean.setDuration("Sep 2025 – Feb 2026");
            sampleBean.setResponsibilities("Skilled in full-stack development, database management, and writing clean, maintainable code using Python, JavaScript, and SQL. Proven ability to collaborate in agile teams to build and troubleshoot real-world software solutions, eager to contribute strong problem-solving skills to a junior developer role.");

            sampleBean.setTechnicalSkills("Java, JSP/Servlets, HTML5, CSS3, SQL, Git, Apache Maven");
            sampleBean.setSoftSkills("Problem Solving, Team Collaboration, Time Management, Technical Documentation");

            // Attach bean to request scope and forward to cvView.jsp
            request.setAttribute("cvData", sampleBean);
            RequestDispatcher dispatcher = request.getRequestDispatcher("cvView.jsp");
            dispatcher.forward(request, response);
        } else {
            // Default fallback: redirect to the input form
            response.sendRedirect("cvForm.jsp");
        }
    }

    // Handles HTTP POST requests (submitting the CV input form)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Ensure UTF-8 encoding for special characters
        request.setCharacterEncoding("UTF-8");

        // 1. Instantiate CVBean and populate with form parameters
        CVBean cvBean = new CVBean();
        cvBean.setFullName(request.getParameter("fullName"));
        cvBean.setTitle(request.getParameter("title"));
        cvBean.setEmail(request.getParameter("email"));
        cvBean.setPhone(request.getParameter("phone"));
        cvBean.setLink(request.getParameter("link"));
        cvBean.setSummary(request.getParameter("summary"));

        cvBean.setDegree(request.getParameter("degree"));
        cvBean.setInstitution(request.getParameter("institution"));
        cvBean.setGradYear(request.getParameter("gradYear"));
        cvBean.setMajor(request.getParameter("major"));

        cvBean.setJobTitle(request.getParameter("jobTitle"));
        cvBean.setCompany(request.getParameter("company"));
        cvBean.setDuration(request.getParameter("duration"));
        cvBean.setResponsibilities(request.getParameter("responsibilities"));

        cvBean.setTechnicalSkills(request.getParameter("technicalSkills"));
        cvBean.setSoftSkills(request.getParameter("softSkills"));

        // Keep the bean in the session (before validating) so the form
        // is pre-filled when the user goes back to edit, or after a validation error.
        request.getSession().setAttribute("cvData", cvBean);

        // 2. Validate the bean and route accordingly
        if (cvBean.validate()) {
            request.setAttribute("cvData", cvBean);
            RequestDispatcher dispatcher = request.getRequestDispatcher("cvView.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMsg", "Invalid or missing required fields! Please ensure full name, a valid email address, highest degree, and at least one skill are filled in.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("cvError.jsp");
            dispatcher.forward(request, response);
        }
    }
}