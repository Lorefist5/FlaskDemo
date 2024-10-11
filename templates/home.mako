<%inherit file="base.mako"/>

<%! 
    title = "Home - Task Manager"
%>

<div class="text-center mb-10">
    <h1 class="text-4xl font-bold text-white mb-6">Manage Your Tasks and Organizations</h1>
    <p class="text-gray-400 text-lg mb-6">Track, organize, and manage your tasks and organizations effortlessly.</p>
</div>

<!-- Grid layout for task sections -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <!-- View Tasks -->
    <div class="bg-gray-800 p-6 rounded-lg shadow-md text-center hover:bg-gray-700 transition duration-300">
        <i class="fas fa-tasks text-blue-400 text-4xl mb-4"></i>
        <h2 class="text-2xl font-semibold mb-4">View Your Tasks</h2>
        <p class="text-gray-400 mb-4">See all your tasks in one place and track your progress.</p>
        <a href="/tasks" class="bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-500 transition duration-300">View Tasks</a>
    </div>

    <!-- Manage Organizations -->
    <div class="bg-gray-800 p-6 rounded-lg shadow-md text-center hover:bg-gray-700 transition duration-300">
        <i class="fas fa-building text-green-400 text-4xl mb-4"></i>
        <h2 class="text-2xl font-semibold mb-4">Manage Organizations</h2>
        <p class="text-gray-400 mb-4">Oversee tasks and members within your organization for better collaboration.</p>
        <a href="/organizations" class="bg-green-600 text-white py-2 px-4 rounded-lg hover:bg-green-500 transition duration-300">Manage Organizations</a>
    </div>

    <!-- Schedule Tasks -->
    <div class="bg-gray-800 p-6 rounded-lg shadow-md text-center hover:bg-gray-700 transition duration-300">
        <i class="fas fa-calendar-alt text-purple-400 text-4xl mb-4"></i>
        <h2 class="text-2xl font-semibold mb-4">Schedule Tasks</h2>
        <p class="text-gray-400 mb-4">Plan your tasks ahead and set deadlines to meet your goals.</p>
        <a href="/schedule" class="bg-purple-600 text-white py-2 px-4 rounded-lg hover:bg-purple-500 transition duration-300">Schedule Tasks</a>
    </div>
</div>

<!-- Premium Features Section -->
<div class="mt-12 bg-gray-800 p-8 rounded-lg shadow-md text-center hover:bg-gray-700 transition duration-300">
    <i class="fas fa-star text-yellow-400 text-4xl mb-4"></i>
    <h2 class="text-3xl font-semibold mb-4 text-yellow-500">Unlock Premium Features</h2>
    <p class="text-gray-400 mb-6">Upgrade to premium to access advanced task management features like priority tasks, reminders, and progress tracking.</p>
    <a href="/premium" class="bg-yellow-500 text-white py-3 px-6 rounded-lg hover:bg-yellow-400 transition duration-300 text-lg font-semibold">Upgrade Now</a>
</div>
