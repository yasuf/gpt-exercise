# Install pipenv
pip install pipenv

# Copy repository
https://github.com/yasuf/gpt-exercise

# cd into repo
cd ./gpt-exercise

# Install python version management
curl -fsSL https://pyenv.run | bash

# Add pyenv's python 3.11 version to the $PATH
echo "export PATH=""$PATH:~/.pyenv/versions/3.11.15/bin/" > ~./bashrc

# Setup pipenv environment
pipenv install --python 3.11

# Run training
pipenv run python ./main.py

# E voila, weights are uploaded to wandb!
