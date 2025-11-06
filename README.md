# 機械学習勉強会2025 開発リポジトリ

概要
このリポジトリは、機械学習勉強会2025で使用するすべてのソースコード（Rust, Python）、Jupyter Notebook、およびデータセットを管理する公式リポジトリです。

勉強会での「環境構築のトラブル」をゼロにするため、このプロジェクトは Docker と VSCode Remote-Containers の使用を前提としています。 この手順に従うだけで、参加者全員がOS（Windows, Mac, Linux）に関係なく、100%同一の開発環境を即座に利用できます。

## 1. 初回セットアップ (PCに1回だけ)

以下の4つのツールを、あなたのローカルPCにインストールしてください。

### Git(<https://git-scm.com/>)

ソースコード管理ツールです。
リポジトリのクローンや更新に使用します。

### Docker Desktop(<https://www.docker.com/products/docker-desktop>)

開発環境（コンテナ）を実行するための「エンジン」です。

インストール後、必ず一度起動してください。

### Visual Studio Code(VSCode)(<https://code.visualstudio.com/>)

メインで使用するコードエディタです。

### Remote Development 拡張機能

VSCodeからDockerコンテナに「接続」するための拡張機能です。
VSCodeの拡張機能タブから `Remote Development` と検索してインストールしてください。(4つのサブ拡張機能がまとめてインストールされます)

## 2. 開発環境の起動方法 (勉強会のたびに行う)

### リポジトリをクローン

ターミナル（またはGitクライアント）で、このリポジトリをローカルにクローンします。

```bash
git clone https://github.com/otera256/MLfromZERO.git
```

リポジトリにアップデートがあった場合は、以下のコマンドで最新状態に更新してください。

```bash
cd MLfromZERO　 # クローンしたフォルダに移動
git pull origin main  # 最新の変更を取得
```

### VSCodeでフォルダを開く

VSCodeを起動し、「フォルダを開く」から、先ほどクローンしたフォルダ（MLfromZERO）を選択します。

コンテナで開く

フォルダを開くと、VSCodeの右下に「Reopen in Container (コンテナで再度開く)」という通知が表示されます。

このボタンをクリックしてください。

ビルドを待つ

初回のみ、開発環境（Dockerイメージ）の構築とPythonライブラリのインストール（uvによる）が実行されます。これには数分かかります。

2回目以降は、数秒で開発環境が起動します。

起動が完了すると、VSCodeの左下が「Dev Container: ...」という表示に変わります。これで準備完了です。

## 3. コードの実行方法

開発環境（コンテナ）内では、RustとPython（uvでインストール済み）がすべて使える状態になっています。

### Python (Jupyter Notebook) の実行

VSCodeのファイルエクスプローラー（左側のパネル）から、notebooks/ フォルダ内の .ipynb ファイルを開きます。

VSCodeが自動的にコンテナ内のPythonカーネルを認識します。

セルを選択して実行（Shift + Enter）するだけで、scikit-learnやPyTorchを使ったコードが動作します。

### Rust (from scratch実装) の実行

VSCodeでターミナルを開きます ( Ctrl + Shift + @ またはメニューから「ターミナル > 新しいターミナル」)。

このターミナルは、すでにコンテナの内部に接続されています。

rust_projects フォルダに移動し、cargo run コマンドで各週のプロジェクトを実行します。--package (または -p) フラグで実行したいプロジェクト名を指定してください。

``` bash

# rust_projects フォルダに移動
cd rust_projects

# 例: 第2回の線形回帰を実行する場合
cargo run -p week_02_linear_regression

# 例: 第4回のSVMを実行する場合
cargo run -p week_04_svm
```

## 4. GPU環境での実行 (第14回〜)

Google Colab
第14回以降のGPUを必要とするノートブックは、Google Colabでの実行を推奨しています。
Google Colabへのリンクは随時貼っていきます。

部内GPUサーバー (最終プロジェクト)
Nanochatやロボットアーム制御などの高度なタスクは、部内のGPUサーバーで実行します。 これらの実行手順（サーバーへのSSH、Dockerfile.gpu の使用方法など）については、別途アナウンスします。
