FROM docker.io/arm64v8/ros:humble-ros-base

WORKDIR /tmp
RUN git clone https://github.com/gsl-lite/gsl-lite
WORKDIR /tmp/gsl-lite
RUN mkdir build && cd build
RUN cmake .. && make -j8
RUN sudo make install

WORKDIR /tmp
RUN git clone https://github.com/catchorg/Catch2
WORKDIR /tmp/Catch2
RUN mkdir build && cd build
RUN cmake .. && make -j8
RUN sudo make install

WORKDIR /tmp
RUN git clone https://github.com/fmtlib/fmt
WORKDIR /tmp/fmt
RUN mkdir build && cd build
RUN cmake -DFMT_TEST=OFF ..
RUN make -j8
RUN sudo make install

WORKDIR /tmp
RUN git clone https://github.com/mpusz/mp-units
WORKDIR /tmp/mp-units
RUN mkdir build && cd build
RUN cmake -DMP_UNITS_AS_SYSTEM_HEADERS=ON -DMP_UNITS_BUILD_LA=OFF ..
RUN make -j8
RUN sudo make install

RUN mkdir -p /tmp/colcon_ws/src
WORKDIR /tmp/colcon_ws/src
RUN git clone --recursive https://github.com/107-systems/t07_robot

WORKDIR /tmp/colcon_ws
RUN . /opt/ros/humble/setup.sh && \
    colcon_ws build --symlink-install

COPY start.sh /
RUN chmod ugo+x /start.sh

ENTRYPOINT ["/start.sh"]
