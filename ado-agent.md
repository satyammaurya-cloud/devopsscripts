🔴 To Setup ADO agent into Ubuntu cd /home/IT/

---

```bash

#!/bin/bash

set -e

# ==============================
# Azure DevOps Agent Variables
# ==============================

AZP_URL="https://dev.azure.com/Vistara-Satyam"
PAT="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
AGENT_POOL="tomcat-agent-pool"

AGENT_VERSION="5.279.0"

# Current directory
AGENT_DIR="$(pwd)"

# ==============================
# Setup
# ==============================

cd "$AGENT_DIR"
echo "Agent Directory: $AGENT_DIR"
echo "Downloading Azure DevOps Agent..."

rm -f agent.tar.gz
wget -O agent.tar.gz \
"https://download.agent.dev.azure.com/agent/${AGENT_VERSION}/vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz"

echo "Checking downloaded file..."
ls -lh agent.tar.gz
echo "Extracting agent..."

tar -xzf agent.tar.gz
echo "Configuring agent..."

./config.sh --unattended \
  --url "$AZP_URL" \
  --auth pat \
  --token "$PAT" \
  --pool "$AGENT_POOL" \
  --agent "$(hostname)" \
  --acceptTeeEula \
  --replace

echo "Installing agent service..."
sudo ./svc.sh install
echo "Starting agent service..."
sudo ./svc.sh start

echo "======================================"
echo "Azure DevOps Agent Setup Completed"
echo "======================================"
echo "Organization : $AZP_URL"
echo "Agent Pool   : $AGENT_POOL"
echo "Agent Name   : $(hostname)"
echo "Directory    : $AGENT_DIR"
echo "======================================"

```

---

🔴 To check live agent pipeline jobs logs:

```bash
sudo journalctl -u 'vsts.agent.Vistara\x2dSatyam.tomcat\x2dagent\x2dpool.tomcat.service' -f
```
