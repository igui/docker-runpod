ARG BASE_TAG=latest
FROM runpod/pytorch:${BASE_TAG}

# Install basic packages
RUN apt update && apt install -y zsh vim

# Install all the goodies to run Jupyterlab
RUN pip install jupyter-ai \
	jupyterlab-lsp \
	jupyterlab-code-formatter \
        jedi-language-server \
	black \
	isort \
	langchain-openai

# Copy the startup script
COPY pre_start.sh /pre_start.sh
COPY start.sh /start.sh
COPY post_start.sh /post_start.sh

# Copy the configuration files
COPY jupyter/ /root/.jupyter/
