$ErrorActionPreference = 'Stop'

# clean up old extension
Uninstall-VsCodeExtension -extensionId 'ms-vscode-remote'

Install-VsCodeExtension -extensionId 'remote-ssh@0.97.2023020215'
