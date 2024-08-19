ARG BASE_TAG=latest
FROM runpod/${BASE_TAG}

# Install basic packages
RUN apt update && apt install -y zsh vim

# Install all the goodies to run Jupyterlab
RUN pip install jupyter-ai \
	jupyterlab-lsp \
	jupyterlab-code-formatter \
	black \
	isort \
	langchain-openai


