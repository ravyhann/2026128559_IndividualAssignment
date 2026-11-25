package com.cvbuilder.model;

import java.io.Serializable;

public class CVBean implements Serializable {

    // 1. Private Member Variables
    // Personal Info
    private String fullName;
    private String title;
    private String email;
    private String phone;
    private String link;
    private String summary;

    // Education
    private String degree;
    private String institution;
    private String gradYear;
    private String major;

    // Experience
    private String jobTitle;
    private String company;
    private String duration;
    private String responsibilities;

    // Skills
    private String technicalSkills;
    private String softSkills;

    // 2. Zero-Argument Constructor
    public CVBean() {
    }

    // 3. Validation Method
    public boolean validate() {
        // Check mandatory fields: Name, Email, Degree, and at least one Skill
        if (isEmpty(fullName) || isEmpty(email) || isEmpty(degree)) {
            return false;
        }
        if (isEmpty(technicalSkills) && isEmpty(softSkills)) {
            return false;
        }

        // Basic email format check (must contain '@' and '.' after '@')
        String trimmedEmail = email.trim();
        int atIndex = trimmedEmail.indexOf('@');
        int dotIndex = trimmedEmail.lastIndexOf('.');
        if (atIndex <= 0 || dotIndex <= atIndex + 1 || dotIndex == trimmedEmail.length() - 1) {
            return false;
        }

        return true;
    }

    // Helper method to check if a string is null or blank
    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    // 4. Public Getters and Setters
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getGradYear() {
        return gradYear;
    }

    public void setGradYear(String gradYear) {
        this.gradYear = gradYear;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getResponsibilities() {
        return responsibilities;
    }

    public void setResponsibilities(String responsibilities) {
        this.responsibilities = responsibilities;
    }

    public String getTechnicalSkills() {
        return technicalSkills;
    }

    public void setTechnicalSkills(String technicalSkills) {
        this.technicalSkills = technicalSkills;
    }

    public String getSoftSkills() {
        return softSkills;
    }

    public void setSoftSkills(String softSkills) {
        this.softSkills = softSkills;
    }
}