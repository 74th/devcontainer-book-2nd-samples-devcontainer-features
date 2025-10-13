#!/bin/sh
set -e

FEATURE_DIR=$(dirname $0)
INSTALLED_DIR="/opt/embedding-bedrock-token-for-claudecode-vscode"
BEDROCK_TOKEN_PATH="${BEDROCK_TOKEN_PATH}"

echo "Activating feature 'embedding-bedrock-token-for-claudecode-vscode'"

# 重複インストールの判定
if [ -d "${INSTALLED_DIR}" ]; then
  echo "Embedding bedrock token for claudecode vscode is already installed"
  exit 0
fi

# スクリプトのインストール
mkdir -p ${INSTALLED_DIR}
cp -rf ${FEATURE_DIR}/embedding_script ${INSTALLED_DIR}/
cd ${INSTALLED_DIR}/embedding_script
npm install

# postStartCommand.shの設置
POST_START_COMMAND_PATH="${INSTALLED_DIR}/postStartCommand.sh"
echo "#!/bin/sh" > ${POST_START_COMMAND_PATH}
echo "node ${INSTALLED_DIR}/embedding_script ${BEDROCK_TOKEN_PATH}" >> ${POST_START_COMMAND_PATH}
chmod +x ${POST_START_COMMAND_PATH}
