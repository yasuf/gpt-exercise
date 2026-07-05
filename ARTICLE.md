## Goal
The goal is to create an analysis of how fast you can train a GPT-like neural network and compare different GPUs
and how quick each one of them trains a neural network like this one.

## GPU used and time it took to complete training
- 1x RTX 3060 Ti -  32min 22sec
- 1x RTX 4060 Ti -  X min
- 1x RTX 5060 Ti -  17min 32sec
- 1x RTX 5080    -  9 min 22 sec

## Gotchas
* Use a 32GB disk space instance instead of the default 16GB disk space onces, you will run out of disk space when installing all the dependencies.
* You'll have to install the right drivers for the GPU that you have and that can take some time to setup.
* You'll have to make sure that the python environment has the right drivers using:
```
pipenv run python -c "import torch; print(torch.cuda.is_available())"
```
  Once this returns "True", you should be good to go to train your model.

## Notes
Vast.ai is really easy to use.
It automatically creates a tmux session once you ssh into the container.
It takes one click to rent a server that has a GPU attached to it.
It's really easy to take down a server with one click as well.
It's also really easy to attach a public SSH key to a container to SSH into it.

## Tools used
* Wandb.ai - Store final weights and track runs
* vast.ai - Rent server

## Libraries used
* PyTorch
* Wandb python library
