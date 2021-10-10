from os import environ, path
from dotenv import load_dotenv

basedir = path.abspath(path.dirname(__file__))
load_dotenv(path.join(basedir, '.env'))

dir_path = path.dirname(path.realpath(__file__))

class Config:
    """Set Flask configuration variables from .env file."""

    # General Flask Config
    SECRET_KEY = environ.get('SECRET_KEY')
    FLASK_ENV = environ.get('FLASK_ENV')

    UPLOAD_FOLDER = f'{dir_path}/application/static'
    MAX_CONTENT_PATH = 104857600
    FLASK_APP = 'wsgi.py'
    FLASK_DEBUG = 0
