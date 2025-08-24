# 1. ベースイメージとして公式のPythonイメージを使用
FROM python:3.9-slim

# 2. 作業ディレクトリを設定
WORKDIR /app

# 3. 依存関係ファイルをコピーし、インストール
# まずrequirements.txtだけをコピーすることで、コード変更のたびにライブラリを再インストールするのを防ぎ、ビルドキャッシュを効率化します。
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. アプリケーションのソースコードをコピー
COPY . .

# 5. アプリケーションがリッスンするポートをコンテナに公開
EXPOSE 8000

# 6. コンテナ起動時にGunicornを使ってアプリケーションを実行
# ワーカースレッドを4つ使い、0.0.0.0:8000でリッスンします。
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:8000", "app:app"]
