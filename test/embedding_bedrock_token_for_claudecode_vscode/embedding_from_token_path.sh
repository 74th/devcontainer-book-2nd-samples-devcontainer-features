#!/bin/bash

set -e

source dev-container-features-test-lib

check "execute command" bash -c "cat ~/.vscode-server/data/Machine/settings.json"

reportResults