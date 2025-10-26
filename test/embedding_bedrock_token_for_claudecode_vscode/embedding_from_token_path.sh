#!/bin/bash

set -e

source dev-container-features-test-lib

check "check created setting" bash -c "grep TEST_TOKEN ~/.vscode-server/data/Machine/settings.json"

reportResults