FROM ubuntu:22.04
LABEL devops="prat"

USER root
WORKDIR /opt/
RUN  apt update 
RUN  apt install git  python3 -y
RUN  apt install python3-pip -y
RUN  git clone https://github.com/bartTC/django-markup.git
RUN  pip install django-markup
RUN  pip install django-markup[all_filter_dependencies]
WORKDIR /opt/django-markup/
RUN pip install pipenv
RUN  pipenv install
RUN  pipenv install pytest --dev
RUN  pipenv run pytest
EXPOSE  8000  