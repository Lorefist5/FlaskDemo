from app import db
from models.task_model import Task
from datetime import datetime

class TasksRepository:
    
    @staticmethod
    def create_task(name, deadline=None, started_at=None):
        """Create a new task and save it to the database."""
        new_task = Task(name=name, deadline=deadline, started_at=started_at)
        db.session.add(new_task)
        db.session.commit()
        return new_task

    @staticmethod
    def get_task_by_id(task_id):
        """Retrieve a task by its ID."""
        return Task.query.get(task_id)

    @staticmethod
    def get_all_tasks():
        """Retrieve all tasks."""
        return Task.query.all()

    @staticmethod
    def get_unfinished_tasks():
        """Retrieve all tasks that haven't been finished yet."""
        return Task.query.filter_by(finished=False).all()

    @staticmethod
    def get_tasks_by_deadline(deadline):
        """Retrieve all tasks that are due before a certain deadline."""
        return Task.query.filter(Task.deadline <= deadline).all()

    @staticmethod
    def update_task(task_id, name=None, deadline=None, started_at=None, finished=None):
        """Update an existing task."""
        
        task = Task.query.get(task_id)
        task.started_at = started_at
        if task is None:
            return None
        if name is not None:
            task.name = name
        if deadline is not None:
            task.deadline = deadline
        if finished is not None:
            task.finished = finished

        try:
            db.session.commit()
        except Exception as e:
            db.session.rollback()  # Rollback in case of error
            return None
        
        return task

    @staticmethod
    def delete_task(task_id):
        """Delete a task by its ID."""
        task = Task.query.get(task_id)
        if task:
            db.session.delete(task)
            db.session.commit()
            return True
        return False
