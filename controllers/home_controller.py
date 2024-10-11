from flask import Blueprint
from app import render_mako_template

# Create a Blueprint for the home routes
home_blueprint = Blueprint('home', __name__)

# Home route
@home_blueprint.route('/', methods=['GET'])
def index():
    return render_mako_template('home.mako')
