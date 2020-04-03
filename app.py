import time

from celery import Celery

app = Celery('tasks', broker='redis://taojy123.com:6379/2')

@app.task
def add(x, y):
    time.sleep(60)
    return x + y



