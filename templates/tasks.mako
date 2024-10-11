<%inherit file="base.mako"/>

<%! title = "Tasks List" %>

<div class="bg-gray-800 shadow-md rounded-lg overflow-hidden">
    <div class="bg-blue-700 p-6 flex justify-between items-center">
        <h1 class="text-3xl text-white font-semibold flex items-center">
            <i class="fas fa-tasks mr-3"></i> Task List
        </h1>
        <a href="/tasks/create" class="bg-green-600 text-white py-2 px-4 rounded-lg hover:bg-green-500 transition duration-300 flex items-center">
            <i class="fas fa-plus-circle mr-2"></i> Create Task
        </a>
    </div>
    
    <div class="p-6">
        % if tasks:
        <ul class="divide-y divide-gray-600">
            % for task in tasks:
            <li class="flex justify-between items-center bg-gray-700 hover:bg-gray-600 px-4 py-3 rounded-lg mb-4 transition duration-300">
                <!-- Task Details -->
                <div class="flex flex-col space-y-1">
                    <!-- Task Name and Icon -->
                    <div class="flex items-center space-x-3">
                        <i class="fas fa-check-circle text-blue-400 text-lg"></i>
                        <span class="text-lg">${task.name}</span>
                    </div>
                    <!-- Deadline -->
                    <div class="text-sm text-gray-300">
                        <i class="fas fa-calendar-alt mr-2"></i> 
                        Deadline: ${task.deadline if task.deadline else 'No deadline'}
                    </div>
                    <!-- Created At -->
                    <div class="text-sm text-gray-300">
                        <i class="fas fa-clock mr-2"></i> 
                        Created At: ${task.created_at.strftime('%Y-%m-%d %H:%M:%S')}
                    </div>
                    <!-- Task Status: Started or Not -->
                    <div class="text-sm ${'text-green-400' if task.started_at else 'text-red-400'}">
                        <i class="fas ${'fa-play-circle' if task.started_at else 'fa-pause-circle'} mr-2"></i> 
                        Status: ${'Started at ' + task.started_at.strftime('%Y-%m-%d %H:%M:%S') if task.started_at else 'Not Started'}
                    </div>
                </div>

                <!-- Task Actions -->
                <div class="flex space-x-4">
                    <!-- Edit and Delete Buttons -->
                    <a href="/tasks/edit/${task.id}" class="text-yellow-400 hover:text-yellow-300 transition duration-300">
                        <i class="fas fa-edit"></i> Edit
                    </a>
                    <a href="/tasks/delete/${task.id}" class="text-red-400 hover:text-red-300 transition duration-300">
                        <i class="fas fa-trash-alt"></i> Delete
                    </a>

                    <!-- Toggle Task Button (Start/Stop) -->
                    <a href="/tasks/toggle/${task.id}" class="text-blue-400 hover:text-blue-300 transition duration-300">
                        <i class="fas ${'fa-stop-circle' if task.started_at else 'fa-play-circle'}"></i> 
                        ${'Stop Task' if task.started_at else 'Start Task'}
                    </a>
                </div>
            </li>
            % endfor
        </ul>
        % else:
        <p class="text-center text-gray-400">No tasks found. Create a new task!</p>
        % endif
    </div>
</div>
