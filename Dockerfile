FROM docker.io/arm64v8/ros:humble-ros-base

RUN apt update && apt install can-utils

WORKDIR /tmp

RUN git clone https://github.com/gsl-lite/gsl-lite && cd gsl-lite && \
    mkdir build && cd build && \
    cmake .. && make -j8 && \
    sudo make install

RUN git clone https://github.com/catchorg/Catch2 && cd Catch2 && \
    mkdir build && cd build && \
    cmake .. && make -j8 && \
    sudo make install

RUN git clone https://github.com/fmtlib/fmt && cd fmt && \
    mkdir build && cd build && \
    cmake -DFMT_TEST=OFF .. && \
    make -j8 && \
    sudo make install

RUN mkdir -p /tmp/colcon_ws/src
WORKDIR /tmp/colcon_ws/src
RUN git clone --recursive https://github.com/107-systems/t07_robot

WORKDIR /tmp/colcon_ws
RUN . /opt/ros/humble/setup.sh && \
    colcon build

COPY start.sh /
RUN chmod ugo+x /start.sh

ENTRYPOINT ["/start.sh"]
