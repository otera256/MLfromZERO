# Dockerfile (ローカル / VSCode Devcontainer用)

# 1. ベースイメージ: Microsoftが提供するRust 1 (latest) のDevcontainer用イメージを使用
# これにより、Rust、Git、zsh、Node.jsなど開発に必要な基本ツールが揃う
FROM mcr.microsoft.com/devcontainers/rust:1

# 2. aptパッケージの更新とPython、ツールのインストール
# (ベースイメージにpython3は入っているが、pipやvenvを明示的に入れる)
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pip \
    python3-venv \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
USER vscode

# 3. uv (高速Pythonパッケージインストーラー) のインストール
# Rustがインストール済みなので、cargoでuvをインストールするのが簡単
RUN cargo install uv

# 4. uvで仮想環境を作成
# /home/vscode/venv に仮想環境を作成し、uvをアクティベート
RUN uv venv /home/vscode/venv && \
    echo "source /home/vscode/venv/bin/activate" >> /home/vscode/.bashrc && \
    echo "source /home/vscode/venv/bin/activate" >> /home/vscode/.zshrc

# 5. requirements.txtをコピー
# （.devcontainer.jsonがコンテナにワークスペース全体をマウントするが、
#  ビルド時に先にコピーしておくとキャッシュが効きやすい）
COPY requirements.txt /tmp/requirements.txt

# 6. uvを使ってPythonパッケージをインストール
# /home/vscode/venv/bin/uv を直接指定して実行
RUN /home/vscode/venv/bin/uv pip install -r /tmp/requirements.txt

# 7. PyTorch (CPU版) をインストール
RUN /home/vscode/venv/bin/uv pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu

# 8. .devcontainer.jsonから参照されるため、コンテナの起動を維持する
CMD ["sleep", "infinity"]