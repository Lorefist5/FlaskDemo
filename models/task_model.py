from app import db
from datetime import datetime

class Task(db.Model):
    __tablename__ = 'tasks'
    
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    deadline = db.Column(db.DateTime, nullable=True)  # Deadline for the task
    created_at = db.Column(db.DateTime, default=datetime.utcnow)  # When the task was created
    started_at = db.Column(db.DateTime, nullable=True)  # When the task was started
    finished = db.Column(db.Boolean, default=False)  # Whether the task has been completed

    def __init__(self, name, deadline=None, started_at=None, finished=False):
        self.name = name
        self.deadline = deadline
        self.started_at = started_at
        self.finished = finished

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'deadline': self.deadline.isoformat() if self.deadline else None,  # ISO format for datetime
            'created_at': self.created_at.isoformat(),
            'started_at': self.started_at.isoformat() if self.started_at else None,
            'finished': self.finished
        }
