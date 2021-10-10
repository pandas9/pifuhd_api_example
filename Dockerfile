FROM python:3.9.6

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

RUN sed -i 's/\r$//' ./download_trained_models.sh  && chmod +x ./download_trained_models.sh

RUN ./download_trained_models.sh

ENTRYPOINT ["python"]

CMD ["flask", "run"]
