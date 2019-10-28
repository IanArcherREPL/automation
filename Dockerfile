FROM selenium/standalone-chrome-debug

USER root

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    ANDROID_HOME="/usr/local/android-sdk" \
    ANDROID_VERSION=28 \
    ANDROID_BUILD_TOOLS_VERSION=27.0.3 \
    ANDROID_AVD_HOME="/root/.android/avd"
# Download Android SDK
RUN mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && mkdir "$ANDROID_HOME/licenses" || true \
    && echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$ANDROID_HOME/licenses/android-sdk-license"
#    && yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses
# Install Android Build Tool and Libraries
RUN $ANDROID_HOME/tools/bin/sdkmanager --update
RUN $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${ANDROID_VERSION}" \
    "platform-tools"

ENV PATH $PATH:$JAVA_HOME:$ANDROID_HOME:$ANDROID_HOME/emulator:$ANDROID_HOME/tools

RUN $ANDROID_HOME/tools/bin/sdkmanager --install "system-images;android-28;google_apis;x86_64"
RUN echo no | $ANDROID_HOME/tools/bin/avdmanager create avd --force --name testAVD --abi google_apis/x86_64 --package "system-images;android-28;google_apis;x86_64"

RUN apt-get update && \
  apt-get -y install libgl1-mesa-glx libgl1-mesa-dri && \
  rm -rf /var/lib/apt/lists/*
