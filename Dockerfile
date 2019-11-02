FROM selenium/standalone-chrome-debug:latest

ENTRYPOINT []








# escape=`
# FROM mcr.microsoft.com/windows/servercore:1903

# RUN powershell -Command `
#     Add-WindowsFeature Web-Server; `
#     Invoke-WebRequest -UseBasicParsing -Uri "https://dotnetbinaries.blob.core.windows.net/servicemonitor/2.0.1.6/ServiceMonitor.exe" -OutFile "C:\ServiceMonitor.exe"

# EXPOSE 80

# ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]

# # FROM appium/appium-emulator:latest

# FROM selenium/standalone-chrome-debug

# USER root

# # Install KVM
# RUN apt-get update -qqy \
#     && apt-get -qqy install libglu1 qemu-kvm libvirt-dev virtinst bridge-utils msr-tools kmod \
#     && wget -q http://security.ubuntu.com/ubuntu/pool/main/c/cpu-checker/cpu-checker_0.7-0ubuntu7_amd64.deb \
#     && dpkg -i cpu-checker_0.7-0ubuntu7_amd64.deb \
#     && apt-get install -f 

# # Install OpenJDK-8
# RUN apt-get update && \
#     apt-get install -y openjdk-8-jdk && \
#     apt-get install -y ant && \
#     apt-get clean;

# # Fix certificate issues
# RUN apt-get update && \
#     apt-get install ca-certificates-java && \
#     apt-get clean && \
#     update-ca-certificates -f;

# # Setup JAVA_HOME -- useful for docker commandline
# ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
# RUN export JAVA_HOME

# ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
#     ANDROID_HOME="/usr/local/android-sdk" \
#     ANDROID_VERSION=28 \
#     ANDROID_BUILD_TOOLS_VERSION=29.0.0 \
#     ANDROID_AVD_HOME="/root/.android/avd"
# # Download Android SDK
# RUN mkdir "$ANDROID_HOME" .android \
#     && cd "$ANDROID_HOME" \
#     && curl -o sdk.zip $SDK_URL \
#     && unzip sdk.zip \
#     && rm sdk.zip \
#     && mkdir "$ANDROID_HOME/licenses" || true \
#     && echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$ANDROID_HOME/licenses/android-sdk-license"
# #    && yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses
# # Install Android Build Tool and Libraries
# RUN $ANDROID_HOME/tools/bin/sdkmanager --update
# RUN $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
#     "platforms;android-${ANDROID_VERSION}" \
#     "platform-tools"

# ENV PATH $PATH:$JAVA_HOME:$ANDROID_HOME:$ANDROID_HOME/emulator:$ANDROID_HOME/tools

# RUN $ANDROID_HOME/tools/bin/sdkmanager --install "system-images;android-24;google_apis;arm64-v8a"
# RUN echo no | $ANDROID_HOME/tools/bin/avdmanager create avd --force --name testAVD --abi google_apis/arm64-v8a --package "system-images;android-24;google_apis;arm64-v8a"

