FROM python:3.9.7-alpine
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV POETRY_VERSION=1.1.14
RUN apk update
RUN apk add --no-cache postgresql-dev git gcc python3-dev musl-dev \
    && apk add jpeg-dev zlib-dev libmagic

WORKDIR /code
COPY . /code
RUN pip install --upgrade pip
RUN pip install "poetry==$POETRY_VERSION" --no-cache-dir
RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi

CMD [ "python", "./example_math/math.py"]