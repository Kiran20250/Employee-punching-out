<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Dashboard</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet"/>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    div class="modal-body">
                <p><strong>Title:</strong> <span id="taskModalTitleText"></span></p>
                <p><strong>Summary:</strong> <span id="taskModalSummary"></span></p>
                <p><strong>Description:</strong> <span id="taskModalDescription"></span></p>
                <p><strong>Assigned By:</strong> <span id="taskModalAssignedBy"></span></p>
                <p><strong>Priority:</strong> <span id="taskModalPriority"></span></p>
                <p><strong>Deadline:</strong> <span id="taskModalDeadline"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="taskDetailUpdateBtn">Update</button>
                <button type="button" class="btn btn-danger" id="taskDetailDeleteBtn">Delete</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Add Task Modal -->
<div class="modal fade" id="addTaskModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <form action="${pageContext.request.contextPath}/admin/assign-task" method="post">
            <div class="modal-content">
                <di    </div>
</div>

<!-- Update Task Modal -->
<div class="modal fade" id="updateTaskModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <form action="${pageContext.request.contextPath}/admin/update-task" method="post" id="updateTaskForm">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Update Task</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="taskId" id="updateTaskId">
          <div class="mb-3">
            <label>Title</label>
            <input type="text" name="title" id="updateTitle" class="form-control" required>
          </div>
          <div class="mb-3">
            <label>Summary</label>
            <input type="text" name="summary" id="updateSummary" class="form-control" required>
          </div>
          <div class="mb-3">
            <label>Description</label>
            <textarea name="description" id="updateDescription" class="form-control" required></textarea>
          </div>
          <div class="mb-3">
            <label>Due Date</label>
            <input type="date" name="dueDate" id="updateDueDate" class="form-control">
          </div>
          <div class="mb-3">
            <label>Priority</label>
            <select name="priority" id="updatePriority" class="form-control">
                <option value="1">Critical</option>
                <option value="2">High</option>
                <option value="3">Medium</option>
                <option value="4">Low</option>
                <option value="5">Optional</option>
            </select>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Update</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Task Modal JS -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    let currentTaskCard = null; // store currently clicked task

    const taskCards = document.querySelectorAll(".task-card");

    taskCards.forEach(card => {
        card.addEventListener("click", function () {
            currentTaskCard = this; // store clicked task

            // Fill Task Detail modal
            document.getElementById("taskModalTitleText").textContent = this.dataset.title;
            document.getElementById("taskModalSummary").textContent = this.dataset.summary;
            document.getElementById("taskModalDescription").textContent = this.dataset.description;
            document.getElementById("taskModalAssignedBy").textContent = this.dataset.assignedby;
            document.getElementById("taskModalDeadline").textContent = this.dataset.duedate;
            const priorityMap = {1:"Critical",2:"High",3:"Medium",4:"Low",5:"Optional"};
            document.getElementById("taskModalPriority").textContent = priorityMap[this.dataset.priority];

            // Set Update/Delete buttons
            document.getElementById("taskDetailUpdateBtn").dataset.taskId = this.dataset.taskId;
            document.getElementById("taskDetailDeleteBtn").dataset.taskId = this.dataset.taskId;
        });
    });

    // Update button → open Update Modal
    document.getElementById("taskDetailUpdateBtn").onclick = function () {
        if (!currentTaskCard) return;

        document.getElementById("updateTaskId").value = currentTaskCard.dataset.taskId;
        document.getElementById("updateTitle").value = currentTaskCard.dataset.title;
        document.getElementById("updateSummary").value = currentTaskCard.dataset.summary;
        document.getElementById("updateDescription").value = currentTaskCard.dataset.description;

        // Handle "No Deadline"
        document.getElementById("updateDueDate").value =
            currentTaskCard.dataset.duedate !== 'No Deadline' ? currentTaskCard.dataset.duedate : '';

        document.getElementById("updatePriority").value = currentTaskCard.dataset.priority;

        // Show Update modal
        const updateModal = new bootstrap.Modal(document.getElementById("updateTaskModal"));
        updateModal.show();
    };

    // Delete button
    document.getElementById("taskDetailDeleteBtn").onclick = function () {
        const taskId = this.dataset.taskId;
        if (confirm("Are you sure you want to delete this task?")) {
            fetch('${pageContext.request.contextPath}/admin/delete-task?taskId=' + taskId, { method: 'POST' })
                .then(() => location.reload());
        }
    };
});
</script>

</script>
</body>
</html>

