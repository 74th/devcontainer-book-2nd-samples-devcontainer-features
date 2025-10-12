#!/bin/sh
set -e

# optionのバージョンを受け取る
FLYWAY_VERSION="${VERSION:-"8.1.0"}"

echo "Activating feature 'flyway'"

# 重複インストールの判定
if [ -d "/usr/local/lib/flyway" ]; then
  echo "Flyway is already installed"
  exit 0
fi

# インストール作業に必要なパッケージをインストール
if ! command -v curl >/dev/null; then
  echo "curl is not installed, installing it now"
  # ここではDebian系のみをサポート
  apt-get update && apt-get install -y curl
fi


# /usr/local/lib/flywayにインストール
mkdir -p /usr/local/lib/flyway
cd /usr/local/lib/flyway
curl -L https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz -o flyway-commandline-${FLYWAY_VERSION}.tar.gz
tar -xzf flyway-commandline-${FLYWAY_VERSION}.tar.gz --strip-components=1
rm flyway-commandline-${FLYWAY_VERSION}.tar.gz
# 読み込み権限を付与
chmod 755 /usr/local/lib/flyway/flyway
ln -s /usr/local/lib/flyway/flyway /usr/local/bin/flyway
