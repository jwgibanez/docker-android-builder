FROM runmymind/docker-android-sdk:latest

# Install dependencies for constraint layout
RUN echo y | $ANDROID_HOME/tools/bin/sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2"
RUN echo y | $ANDROID_HOME/tools/bin/sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2"

# Update apt
RUN apt-get update

# Install ruby
RUN apt-get -y install ruby-full

# Install fastlane
RUN apt-get -y install build-essential patch ruby-dev zlib1g-dev liblzma-dev
RUN gem install fastlane -NV

# Clear ram
COPY clearRAM.sh .
RUN ls
RUN ./clearRAM.sh
