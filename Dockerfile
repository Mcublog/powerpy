FROM tobix/pywine:latest

ARG PWSH_VERSION=7.2.4

RUN mkdir /tmp/helper && cd /tmp/helper && \
    curl -LOOO \
    https://github.com/PowerShell/PowerShell/releases/download/v${PWSH_VERSION}/PowerShell-${PWSH_VERSION}-win-x86.msi && \
    wine msiexec /i /tmp/helper/PowerShell-${PWSH_VERSION}-win-x86.msi Include_doc=0 InstallAllUsers=1 PrependPath=1 && \
    wineserver -w && \
    rm -rf /tmp/helper && \
    rm -rf /tmp/.wine-0

CMD ["wine" ,"pwsh"]