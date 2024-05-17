FROM python:bullseye

# ! set env variables
# ! noninteractive - zero interaction while installing or upgrading with apt
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update -y --no-install-recommends

RUN apt-get install \
	git \
	curl \
	ca-certificates \
	gcc \
	g++ \
	dialog \
	-y --no-install-recommends

RUN python3 -m pip install --upgrade pip \
	&& python3 -m pip install --upgrade tweety-ns \
	&& pip3 install python-dotenv

RUN git clone https://github.com/jsjohn1951/core-twitter.git app

# COPY ./app /app
COPY ./scripts /scripts

# ! dialog - The default frontend for apt/apt-get under Debian/Ubuntu Linux.
ENV DEBIAN_FRONTEND=dialog