## What is this repo?

A repo to train a GPT neural network, this is only the pretraining step, without assistant fine-tunning that performs Q&A chats.

## How to setup project in a remote environment to run training

1. Clone the repository and cd into it

```
git clone https://github.com/yasuf/gpt-exercise
cd ./gpt-exercise
sh setup.sh
```

## Troubleshooting

### Installed the wrong pytorch version, or pytorch version mismatch

If you have installed the wrong pytorch version:

```
# Here the wrong version is already installed, uninstall it and install the correct version after, in this case 12.6 (cu126)
pipenv run pip uninstall torch -y && pipenv run pip install torch --index-url https://download.pytorch.org/whl/cu124
```

### How to check which cuda version the server needs

By running `nvidia-smi` while ssh'd to the server

To check the current installed torch cuda version in pipenv, run:
```
pipenv run python -c "import torch; print(torch.version.cuda)"
```

To verifu if cuda is available in a container, run:
```
pipenv run python -c "import torch; print(torch.cuda.is_available())"
```

### If you get an error on a C libary like this one

```
root@C.43875408:/workspace/gpt-exercise$ pipenv run python main.py
Traceback (most recent call last):
  File "/workspace/gpt-exercise/main.py", line 1, in <module>
    import torch
  File "/root/.local/share/virtualenvs/gpt-exercise-OdaDKIIp/lib/python3.11/site-packages/torch/__init__.py", line 444, in <module>
    from torch._C import *  # noqa: F403
    ^^^^^^^^^^^^^^^^^^^^^^
ImportError: /root/.local/share/virtualenvs/gpt-exercise-OdaDKIIp/lib/python3.11/site-packages/torch/lib/libtorch_cuda.so: undefined symbol: ncclCommResume
```

Run:

```
pipenv run pip install --upgrade nvidia-nccl-cu12
```

It upgrades the version of a nvidia dependency that fixes the C dependency
