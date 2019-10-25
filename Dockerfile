FROM iidateco/alpine-firebase

SHELL ["/bin/bash", "-c"]

RUN \
    source ~/.bashrc && \
    cd tmp && \
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-268.0.0-linux-x86_64.tar.gz && \
    cd /root && \
    tar zxvf /tmp/google-cloud-sdk-268.0.0-linux-x86_64.tar.gz google-cloud-sdk && \
    ./google-cloud-sdk/install.sh --quiet && \
    rm /tmp/google-cloud-sdk-268.0.0-linux-x86_64.tar.gz && \
    echo '' >> ~/.bashrc && \
    echo '# The next line updates PATH for the Google Cloud SDK.' >> ~/.bashrc && \
    echo "if [ -f '/root/google-cloud-sdk/path.bash.inc' ]; then . '/root/google-cloud-sdk/path.bash.inc'; fi" >> ~/.bashrc && \
    echo '' >> ~/.bashrc && \
    echo '# The next line enables shell command completion for gcloud.' >> ~/.bashrc && \
    echo "if [ -f '/root/google-cloud-sdk/completion.bash.inc' ]; then . '/root/google-cloud-sdk/completion.bash.inc'; fi" >> ~/.bashrc
