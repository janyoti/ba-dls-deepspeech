FROM nvidia/cuda:9.0-devel-ubuntu16.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential git python3-dev python3-pip python3-setuptools
RUN pip3 install 'theano==0.8.2'
RUN pip3 install https://github.com/Lasagne/Lasagne/archive/master.zip
RUN pip3 install 'scipy==0.18.1'
RUN apt-get update
RUN apt-get install -y cmake
WORKDIR /home/downloads
RUN git clone https://github.com/baidu-research/warp-ctc.git
WORKDIR /home/downloads/warp-ctc/build
RUN cmake ../
RUN make
WORKDIR /home/downloads
RUN git clone https://github.com/sherjilozair/ctc
WORKDIR /home/downloads/ctc/build
RUN cmake ../
RUN make
WORKDIR /home/downloads/ctc/python
RUN python3 setup.py install
WORKDIR /home
CMD bash
