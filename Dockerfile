FROM python:3.9.6

WORKDIR /app

COPY . /app

RUN mkdir ./application/checkpoints

RUN mkdir ./application/static

RUN pip install --no-cache-dir -r requirements.txt

RUN wget "http://dl.fbaipublicfiles.com/pifuhd/checkpoints/pifuhd.pt"

RUN curl -LO "https://download.01.org/opencv/openvino_training_extensions/models/human_pose_estimation/checkpoint_iter_370000.pth"

RUN mv ./pifuhd.pt ./application/checkpoints/pifuhd.pt

RUN mv ./checkpoint_iter_370000.pth ./application/checkpoints/rect.pth

ENTRYPOINT ["python"]

CMD ["flask", "run"]
