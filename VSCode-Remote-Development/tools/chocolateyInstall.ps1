$ErrorActionPreference = 'Stop'

# clean up old extension
Uninstall-VsCodeExtension -extensionId 'ms-vscode-remote.vscode-remote-extensionpack'

Install-VsCodeExtension -extensionId 'ms-vscode-remote.vscode-remote-extensionpack@0.23.0'
