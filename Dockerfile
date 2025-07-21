FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim
WORKDIR /bot

# Choreoでも動くようにユーザーを設定
RUN adduser --uid 10001 --disabled-password --gecos '' appuser
RUN chown -R 10001:10001 /bot
COPY --chown=10001:10001 . /bot
USER 10001

RUN uv sync --frozen --no-dev
EXPOSE 8080
CMD ["uv", "run", "main.py"]
