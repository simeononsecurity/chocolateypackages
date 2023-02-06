$ErrorActionPreference = 'Stop'

# clean up old extension
Uninstall-VsCodeExtension -extensionId 'ms-vscode-remote.remote-ssh'

Install-VsCodeExtension -extensionId 'ms-vscode-remote.remote-ssh@0.97.2023020215'
