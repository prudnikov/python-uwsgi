FROM python:3.7

MAINTAINER Vladimir Prudnikov

RUN apt-get update && apt-get install -y --no-install-recommends \
		build-essential \
        python-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install uwsgi
RUN useradd --system --no-create-home --shell /bin/false uwsgi

RUN mkdir /app
ADD uwsgi.ini /etc
ADD wsgi.py /app

WORKDIR /app

ENTRYPOINT ["uwsgi", "--ini=/etc/uwsgi.ini" ]