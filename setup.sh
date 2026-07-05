read -p "Enter a graphics card name: (e.g. ""RTX 3070"") " GRAPHICS_CARD
read -p "Enter the number of graphics cards: (e.g. 1, 2 or more) " NUM_GRAPHICS_CARDS

# # Install python version management
# echo "Installing pyenv to manage python versions.."
bash -c "$(curl -fsSL https://pyenv.run)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Install python version
pyenv install 3.11

# # Install pipenv
echo "Installing pipenv.."
pip install pipenv

# # Setup pipenv environment
echo "Installing python 3.11.."
pipenv install --python 3.11

# # Add pyenv's python 3.11 version to the $PATH
echo "Configuring python 3.11 to PATH.."
echo "export PATH='$PATH:~/.pyenv/versions/3.11.15/bin/'" > ~/.bashrc && source ~/.bashrc

# # Install the torch version that has CUDA 13.0 GPU drivers
echo "Installing pytorch for CUDA 13.0.."
# Check the GPU driver version with nvidia-smi and install the proper drivers for pytorch
pipenv run pip install torch --index-url https://download.pytorch.org/whl/cu132

# # Create the pipenv environment
echo "Creating pipenv environment.."
pipenv install

# # Run training using the independent pipenv
echo "Starting training script.."
pipenv run python ./main.py

# # E voila, weights are uploaded to wandb!
