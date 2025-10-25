# 1. ベースイメージ
FROM openjdk:17-jdk-slim

# 2. 作業ディレクトリ
WORKDIR /app

# 3. ビルド済みjarをコンテナにコピー
COPY target/backend-0.0.1-SNAPSHOT.jar app.jar

# 4. アプリ実行
ENTRYPOINT ["java", "-jar", "app.jar"]
