from flask import Flask, request, redirect, url_for
from mako.lookup import TemplateLookup
from extension import db
from config import Config
import os

# Set up Mako template lookup outside the create_app function
template_lookup = TemplateLookup(directories=[os.path.join(os.path.dirname(__file__), 'templates')])

# Utility function to render Mako templates
def render_mako_template(template_name, **kwargs):
    template = template_lookup.get_template(template_name)
    return template.render(**kwargs)

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Initialize the database
    db.init_app(app)

    # Import and register blueprints
    from controllers.tasks_controller import tasks_blueprint
    from controllers.home_controller import home_blueprint  # Import home_blueprint
    
    app.register_blueprint(tasks_blueprint, url_prefix='/tasks')
    app.register_blueprint(home_blueprint, url_prefix='/')  # Register home blueprint

    return app

if __name__ == '__main__':
    app = create_app()

    # Ensure the database is created if it doesn't exist
    with app.app_context():
        db.create_all()

    # Run the app
    app.run(host='0.0.0.0', port=5000)