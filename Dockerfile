FROM python:3.10-slim-bullseye
 
ENV HOST=0.0.0.0
 
ENV LISTEN_PORT 8080
 
EXPOSE 8080
 
RUN apt-get update && apt-get install -y git
 
COPY ./requirements.txt /app/requirements.txt
 
RUN pip install --no-cache-dir -r /app/requirements.txt
 
WORKDIR app/
 
COPY ./.env /app/.env
COPY ./app.py /app/app.py
COPY ./htmlTemplates.py /app/htmlTemplates.py
 
CMD ["streamlit", "run", "app.py", "--server.port", "8080"]

# /Users/shhhmel/Private/Projects/llm/ask-multiple-pdfs/.venv/lib/python3.10/site-packages/torch/lib