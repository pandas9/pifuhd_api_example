#!/bin/bash

set -ex

cd application
cd checkpoints

wget "http://dl.fbaipublicfiles.com/pifuhd/checkpoints/pifuhd.pt"
curl -LO "https://download.01.org/opencv/openvino_training_extensions/models/human_pose_estimation/checkpoint_iter_370000.pth"
mv checkpoint_iter_370000.pth rect.pth
