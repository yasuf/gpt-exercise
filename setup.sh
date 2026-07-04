# Install python version management
curl -fsSL https://pyenv.run | bash

# Add pyenv's python 3.11 version to the $PATH
echo "export PATH='$PATH:~/.pyenv/versions/3.11.15/bin/'" > ~./bashrc

# Install pipenv
pip install pipenv

# Setup pipenv environment
pipenv install --python 3.11

# Install the torch version that has CUDA 13.0 GPU drivers
pip install torch --index-url https://download.pytorch.org/whl/cu130

# Run training
pipenv run python ./main.py

# E voila, weights are uploaded to wandb!
pipenv install
