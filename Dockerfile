ARG BASE_TAG=latest
FROM runpod/pytorch:${BASE_TAG}

# Install basic packages
RUN apt update && apt install -y zsh vim

# Install all the goodies to run Jupyterlab
RUN pip install jupyter-ai \
	jupyterlab-lsp \
	jupyterlab-code-formatter \
	black \
	isort \
	langchain-openai

# Copy the configuration files
COPY jupyter/ /etc/jupyter/
