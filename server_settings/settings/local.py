from .base import *

SECRET_KEY = os.environ.get('SECRET_KEY', 'unsafe-secret-key')
algorithm = os.environ.get('algorithm')

DEBUG = True
ALLOWED_HOSTS = ['*']


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

