FROM docker.io/arm64v8/ros:humble-ros-base

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
    RUN mkdir build && cd build && \
    cmake -DFMT_TEST=OFF .. && \
    make -j8 && \
    sudo make install

RUN git clone https://github.com/mpusz/mp-units && cd mp-units && \
    mkdir build && cd build && \
    cmake -DMP_UNITS_AS_SYSTEM_HEADERS=ON -DMP_UNITS_BUILD_LA=OFF .. && \
    make -j8 && \
    sudo make install

RUN mkdir -p /tmp/colcon_ws/src
WORKDIR /tmp/colcon_ws/src
RUN git clone --recursive https://github.com/107-systems/t07_robot

WORKDIR /tmp/colcon_ws
RUN . /opt/ros/humble/setup.sh && \
    colcon_ws build --symlink-install

COPY start.sh /
RUN chmod ugo+x /start.sh

ENTRYPOINT ["/start.sh"]
