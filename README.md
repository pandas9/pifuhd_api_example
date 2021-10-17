# Running
inside terminal execute <br />
docker build -t pifuhd-flask . <br />
docker run -d -p 8080:8080 pifuhd-flask <br />
for cuda11 docker run -d -p 8080:8080 --gpus all nvidia/cuda:11.0-base pifuhd-flask <br />

# Navigating files and folders
lib folder is the good stuff <br />
utils.py is bridge between web app and pifuhd <br />

# TODO
- allow only one image file instead of checking file name <br />
- add uuid to file names <br />
- generate directly to static folder <br />
