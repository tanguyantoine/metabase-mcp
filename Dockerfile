FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

RUN useradd --create-home --shell /bin/bash appuser

COPY pyproject.toml README.md server.py /app/

RUN pip install --no-cache-dir .

USER appuser

EXPOSE 8000

ENTRYPOINT ["metabase-mcp"]
CMD ["--http"]
