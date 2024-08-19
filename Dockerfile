FROM runpod/pytorch:2.2.0-py3.10-cuda12.1.1-devel-ubuntu22.04

# Install basic packages
RUN apt update && apt install -y zsh vim

# Install all the goodies to run Jupyterlab
RUN pip install jupyter-ai \
	jupyterlab-lsp \
	jupyterlab-code-formatter \
	black \
	isort \
	langchain-openai


