<%! 
    # Mako allows for inline Python code in templates, which can be used globally across pages.
    title = "Task Manager"
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <!-- Tailwind CSS from CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="bg-gray-900 text-white flex flex-col min-h-screen">

    <!-- Navbar -->
    <nav class="bg-gray-800 p-4 shadow-md">
        <div class="max-w-6xl mx-auto flex justify-between items-center">
            <!-- Logo and Title -->
            <div class="text-2xl font-semibold text-white">Task Manager</div>
            
            <!-- Desktop Links -->
            <div class="hidden md:flex space-x-4">
                <a href="/" class="text-gray-300 hover:text-white transition duration-300">Home</a>
                <a href="/tasks" class="text-gray-300 hover:text-white transition duration-300">View Tasks</a>
                <a href="/schedule" class="text-gray-300 hover:text-white transition duration-300">Schedule Tasks</a>
                <a href="/organizations" class="text-gray-300 hover:text-white transition duration-300">Manage Organizations</a>
                <a href="/premium" class="text-yellow-500 hover:text-yellow-300 transition duration-300">Upgrade to Premium</a>
            </div>

            <!-- Mobile Menu Button -->
            <div class="md:hidden">
                <button id="mobile-menu-button" class="text-white focus:outline-none">
                    <i class="fas fa-bars text-2xl"></i>
                </button>
            </div>
        </div>

        <!-- Mobile Menu Links (Hidden by default) -->
        <div id="mobile-menu" class="hidden md:hidden mt-4 space-y-2">
            <a href="/" class="block text-gray-300 hover:text-white transition duration-300">Home</a>
            <a href="/tasks" class="block text-gray-300 hover:text-white transition duration-300">View Tasks</a>
            <a href="/schedule" class="block text-gray-300 hover:text-white transition duration-300">Schedule Tasks</a>
            <a href="/organizations" class="block text-gray-300 hover:text-white transition duration-300">Manage Organizations</a>
            <a href="/premium" class="block text-yellow-500 hover:text-yellow-300 transition duration-300">Upgrade to Premium</a>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="flex-grow container mx-auto mt-10 px-4 sm:px-6 lg:px-8">
        ${self.body()}  <!-- Placeholder for specific page content -->
    </main>

    <!-- Footer -->
    <footer class="bg-gray-800 p-4 text-center text-gray-400 mt-auto">
        Task Manager &copy; 2024
    </footer>

    <!-- Script for mobile menu toggle -->
    <script>
        const mobileMenuButton = document.getElementById('mobile-menu-button');
        const mobileMenu = document.getElementById('mobile-menu');

        mobileMenuButton.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });
    </script>

</body>
</html>
