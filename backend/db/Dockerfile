FROM mysql:8.0

COPY /databases/*.sql /databases/

# テストデータベース作成用のスクリプトをコンテナへコピー
COPY /databases/init_db.sh /docker-entrypoint-initdb.d/

# このフォルダにファイルをコピーして実行権限を付与しておけばmysql起動時に自動実行してくれる
RUN chmod +x /docker-entrypoint-initdb.d/init_db.sh

CMD ["mysqld", "--default-time-zone=Asia/Tokyo"]
