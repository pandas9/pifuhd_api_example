FROM python:3.9.6
 
WORKDIR /app

COPY . /app
 
RUN pip install --no-cache-dir -r requirements.txt
 
ENTRYPOINT ["python"]

CMD ["download_trained_models.py", "flask", "run"]
