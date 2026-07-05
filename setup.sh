# Install python version management
curl -fsSL https://pyenv.run | bash

# Install pipenv
pip install pipenv

# Setup pipenv environment
pipenv install --python 3.11

# Add pyenv's python 3.11 version to the $PATH
echo "export PATH='$PATH:~/.pyenv/versions/3.11.15/bin/'" > ~./bashrc

# Install the torch version that has CUDA 13.0 GPU drivers
pip install torch --index-url https://download.pytorch.org/whl/cu130

# Create the pipenv environment
pipenv install

# Run training using the independent pipenv
pipenv run python ./main.py

# E voila, weights are uploaded to wandb!
