FROM python:3.12-slim

WORKDIR /app

RUN groupadd --system appgroup && \
    useradd --system --gid appgroup appuser

COPY --chown=appuser:appgroup app/app.py .

USER appuser

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/')"

CMD ["python", "app.py"]