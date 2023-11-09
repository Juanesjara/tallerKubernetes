FROM python:3.12.0

RUN mkdir /app
WORKDIR /app


# Install dependencies  
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy project code to the container image.
COPY ./api-peliculas /app


EXPOSE 5000

ENV FLASK_APP="entrypoint:app"
ENV FLASK_ENV="development"
ENV APP_SETTINGS_MODULE="config.default"
CMD ["flask", "run", "--host", "0.0.0.0"]