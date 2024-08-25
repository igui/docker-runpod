ARG BASE_TAG=latest
FROM runpod/pytorch:${BASE_TAG}

# Install basic packages
RUN --mount=type=cache,target=/var/cache/apt \
	apt update && apt install -y vim rclone

# Install all the goodies to run Jupyterlab
RUN --mount=type=cache,target=/root/.cache/pip \
	pip install jupyter-ai \
	jupyterlab-lsp \
	jupyterlab-code-formatter \
        jedi-language-server \
	black \
	isort \
	langchain-openai

# Copy the startup script
COPY pre_start.sh /pre_start.sh
COPY post_start.sh /post_start.sh

