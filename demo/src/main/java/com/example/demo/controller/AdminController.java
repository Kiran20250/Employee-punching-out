package com.example.demo.controller;

import com.example.demo.entity.Admin;
import com.example.demo.entity.Task;
import com.example.demo.entity.User;
import com.example.demo.repository.TaskRepository;
import com.example.demo.service.AdminService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private TaskRepository taskRepository;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    // ---------------- ADMIN DASHBOARD ----------------
    @GetMapping("/admin")
    public String adminDashboard(HttpSession session, Model model) {
        String adminName = (String) session.getAttribute("adminName");
        if (adminName == null) return "redirect:/login";

        Admin admin = adminService.findAdminByUsername(adminName);
        if (admin == null) return "redirect:/login";

        LocalDateTime loginTime = admin.getInTime();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        String inTime = (loginTime != null) ? loginTime.format(formatter) : "--:--";

            }

    // ---------------- ESCALATION VIEW ----------------
    //  Escalation Dashboard
// ---------------- ESCALATION VIEW ----------------
    // ---------------- ESCALATION VIEW ----------------
    @GetMapping("/admin/escalation")
    public String escalationDashboard(HttpSession session, Model model) {
        String adminName = (String) session.getAttribute("adminName");
        if (adminName == null) return "redirect:/login";

        Admin admin = adminService.findAdminByUsername(adminName);
        if (admin == null) return "redirect:/login";

        // ✅ Format login time
        

        //  Always return to admin dashboard
        return "redirect:/admin";
    }


    // ---------------- DELETE TASK ----------------
    @PostMapping("/admin/delete-task")
    public String deleteTask(@RequestParam Long taskId) {
        taskRepository.deleteById(taskId);
        return "redirect:/admin";
    }



}

