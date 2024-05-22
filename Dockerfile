FROM ghcr.io/cayi-77/cpp-build:main
COPY . .
RUN cmake -B build
RUN cmake --build build

RUN ./build/main

FROM debian

COPY --from=0 /workspace/build/main /root

RUN /root/main
