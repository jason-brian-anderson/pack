FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04 as build
ARG DUMMY=$DUMMY

RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*


WORKDIR app

COPY . .
RUN pip install -r requirements.txt
#EXPOSE 8888

# This will start Jupyter Lab upon starting the container
#CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]