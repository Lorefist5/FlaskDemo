<%inherit file="base.mako"/>

<%! 
    title = "Create a New Task"
%>

<style>
    .calendar-white::-webkit-calendar-picker-indicator {
        filter: invert(1);
    }
</style>

<div class="max-w-xl w-full bg-gray-800 rounded-lg p-8 shadow-md mx-auto mt-12">
    <h1 class="text-3xl font-bold mb-6 text-center text-white">
        <i class="fas fa-plus-circle mr-2"></i>Create a New Task
    </h1>
    
    <!-- Task Creation Form -->
    <form id="createTaskForm">
        <!-- Task Name -->
        <div class="mb-6">
            <label for="name" class="block text-lg font-medium text-gray-300 mb-2">
                <i class="fas fa-tasks mr-2"></i> Task Name
            </label>
            <input type="text" id="name" name="name" placeholder="Enter task name" 
                   class="block w-full px-4 py-3 bg-gray-700 text-white border border-gray-600 rounded-md 
                          focus:ring-blue-500 focus:border-blue-500" required>
        </div>

        <!-- Task Deadline -->
        <div class="mb-6">
            <label for="deadline" class="block text-lg font-medium text-gray-300 mb-2">
                <i class="fas fa-calendar-alt mr-2"></i> Deadline
            </label>
            <input type="datetime-local" id="deadline" name="deadline" 
                   class="block w-full px-4 py-3 bg-gray-700 text-white border border-gray-600 rounded-md 
                          focus:ring-blue-500 focus:border-blue-500 calendar-white" required>
        </div>

        <!-- Start Task Immediately -->
        <div class="mb-6 flex items-center">
            <input type="checkbox" id="start_now" class="form-checkbox h-5 w-5 text-green-600 bg-gray-700 border-gray-600 focus:ring-blue-500 rounded">
            <label for="start_now" class="ml-3 text-lg font-medium text-gray-300">
                Start this task right now?
            </label>
        </div>

        <!-- Submit Button -->
        <div class="text-center">
            <button type="submit" 
                    class="bg-green-600 text-white py-3 px-6 rounded-lg hover:bg-green-500 transition duration-300 flex items-center justify-center text-lg font-semibold">
                <i class="fas fa-check-circle mr-2"></i> Create Task
            </button>
        </div>
    </form>

    <!-- Success/Failure Messages -->
    <div id="message" class="mt-6 text-center text-lg"></div>
</div>

<!-- JavaScript to handle form submission via fetch API -->
<script>
    document.getElementById('createTaskForm').addEventListener('submit', async function(event) {
        event.preventDefault();  // Prevent default form submission

        const taskName = document.getElementById('name').value;
        const deadline = document.getElementById('deadline').value;
        const startNow = document.getElementById('start_now').checked;
        const messageDiv = document.getElementById('message');

        try {
            const response = await fetch('/tasks/api', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    name: taskName,
                    deadline: deadline,
                    start_now: startNow
                }),
            });

            if (response.ok) {
                // Clear the form
                document.getElementById('name').value = '';
                document.getElementById('deadline').value = '';
                document.getElementById('start_now').checked = false;
                // Display success message
                messageDiv.innerHTML = '<span class="text-green-500">Task created successfully!</span>';
            } else {
                const errorData = await response.json();
                messageDiv.innerHTML = '<span class="text-red-500">Error: ' + errorData.message + '</span>';
            }
        } catch (error) {
            messageDiv.innerHTML = '<span class="text-red-500">Failed to create task. Try again later.</span>';
        }
    });
</script>
