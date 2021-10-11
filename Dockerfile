FROM python:3.9.6

WORKDIR /app

COPY . /app

RUN apt-get update -y

RUN apt-get install ffmpeg libsm6 libxext6 libgl1 -y

RUN mkdir ./application/checkpoints

RUN mkdir ./application/static

RUN curl -LO "https://download.01.org/opencv/openvino_training_extensions/models/human_pose_estimation/checkpoint_iter_370000.pth"

RUN curl -LO "https://dl.fbaipublicfiles.com/pifuhd/checkpoints/pifuhd.pt"

RUN mv ./pifuhd.pt ./application/checkpoints/pifuhd.pt

RUN mv ./checkpoint_iter_370000.pth ./application/checkpoints/rect.pth

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["python3"]

CMD ["wsgi.py"]
