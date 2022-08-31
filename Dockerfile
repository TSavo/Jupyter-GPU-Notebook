FROM tensorflow/tensorflow:latest-gpu-jupyter
RUN apt update
RUN apt upgrade -y
RUN apt install -y wget build-essential python3-dev ffmpeg libsm6 libxext6
RUN /usr/bin/python3 -m pip install --upgrade pip
RUN pip install opencv-python gdown typer rich big-sleep --upgrade
RUN pip uninstall -y torch torchvision torchaudio 
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
RUN echo "c.NotebookApp.disable_check_xsrf = True" > /root/.jupyter/jupyter_notebook_config.py
EXPOSE 8888/tcp
CMD jupyter notebook --notebook-dir=/content --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.allow_origin='https://colab.research.google.com' --port=8888 --NotebookApp.port_retries=0