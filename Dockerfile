FROM python:3.9.0

RUN mkdir /root/.ssh/

ADD ./.ssh/id_rsa /root/.ssh/id_rsa

RUN echo "01-17  update"

RUN chmod 600 /root/.ssh/id_rsa

RUN touch /root/.ssh/knwon_hosts

RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

WORKDIR /home/

RUN git clone git@github.com:Butler-SIM/Django_CI_CD.git

WORKDIR /home/Django_CI_CD/

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

RUN pip install mysqlclient


EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=server_settings.settings.deploy && gunicorn server_settings.wsgi --env DJANGO_SETTINGS_MODULE=server_settings.settings.deploy --bind 0.0.0.0:8000"]

