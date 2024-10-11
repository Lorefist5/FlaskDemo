from flask import Blueprint, jsonify, request, redirect, url_for
from repositories.task_repository import TasksRepository  # Import the repository
from app import render_mako_template  # Import the render_mako_template function
from datetime import datetime
tasks_blueprint = Blueprint('tasks', __name__)

# View Routes
@tasks_blueprint.route('/', methods=['GET'])
def tasks_page():
    """Renders the tasks page where all tasks are listed."""
    tasks = TasksRepository.get_all_tasks()  # Use the repository to get all tasks
    return render_mako_template('tasks.mako', tasks=tasks)

@tasks_blueprint.route('/create', methods=['GET'])
def create_task_page():
    """Renders the create task page."""
    return render_mako_template('create_task.mako')

# API Routes
@tasks_blueprint.route('/api', methods=['GET'])
def get_tasks():
    """API route to get all tasks in JSON format."""
    tasks = TasksRepository.get_all_tasks()  # Use the repository to get all tasks
    return jsonify([task.serialize() for task in tasks])

@tasks_blueprint.route('/api', methods=['POST'])
def add_task():
    """API route to create a new task with JSON request data."""
    data = request.get_json()

    # Convert the deadline from string to datetime object
    deadline_str = data.get('deadline')
    deadline = datetime.fromisoformat(deadline_str) if deadline_str else None

    # Set started_at if start_now is true
    started_at = datetime.utcnow() if data.get('start_now', False) else None

    # Create the task
    new_task = TasksRepository.create_task(
        name=data['name'], 
        deadline=deadline, 
        started_at=started_at
    )
    
    return jsonify(new_task.serialize()), 201

@tasks_blueprint.route('/toggle/<int:task_id>', methods=['GET'])
def toggle_task(task_id):
    """Toggles the start/stop status of a task."""
    task = TasksRepository.get_task_by_id(task_id)
    
    if task:
        if task.started_at:
            # If the task is already started, stop it by clearing 'started_at'
            TasksRepository.update_task(task_id, started_at=None)
            return redirect(url_for('tasks.tasks_page'))  # Redirect to the tasks list
        else:
            # If the task is not started, start it by setting 'started_at' to current time
            TasksRepository.update_task(task_id, started_at=datetime.utcnow())
            return redirect(url_for('tasks.tasks_page'))  # Redirect to the tasks list
    
    return jsonify({'message': 'Task not found'}), 404
