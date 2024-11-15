FROM continuumio/miniconda3

WORKDIR /app
COPY environment.yml .
RUN apt-get update && apt-get install -y ffmpeg libsm6 libxext6
RUN conda env create -f environment.yml -p .conda
RUN rm -rf /app/.conda/include

COPY . .
CMD ["conda", "run", "--no-capture-output", "-p", "/app/.conda", "python", "hello.py"]
