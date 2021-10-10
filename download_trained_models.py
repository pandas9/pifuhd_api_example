import requests

import os

dir_path = os.path.dirname(os.path.abspath(__file__))

with requests.get("https://www.download.01.org/opencv/openvino_training_extensions/models/human_pose_estimation/checkpoint_iter_370000.pth", stream=True) as r:
    r.raise_for_status()
    with open(f'{dir_path}/application/checkpoints/rect.pth', 'wb') as f:
        for chunk in r.iter_content(chunk_size=8192): 
            f.write(chunk)

with requests.get("http://www.dl.fbaipublicfiles.com/pifuhd/checkpoints/pifuhd.pt", stream=True) as r:
    r.raise_for_status()
    with open(f'{dir_path}/application/checkpoints/pifuhd.pt', 'wb') as f:
        for chunk in r.iter_content(chunk_size=8192): 
            f.write(chunk)
