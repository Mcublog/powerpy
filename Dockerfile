FROM tobix/pywine:latest

ARG PWSH_VERSION=7.2.4

RUN winecfg

RUN mkdir /tmp/helper && cd /tmp/helper && \
    curl -LOOO \
    https://github.com/PowerShell/PowerShell/releases/download/v${PWSH_VERSION}/PowerShell-${PWSH_VERSION}-win-x86.msi

RUN wine msiexec /i /tmp/helper/PowerShell-7.2.4-win-x86.msi Include_doc=0 InstallAllUsers=1 PrependPath=1 && \
    wineserver -w

CMD ["wine" ,"pwsh"]