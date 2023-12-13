#https://hub.docker.com/r/continuumio/miniconda3/dockerfile
FROM ubuntu:22.04

#  $ docker build . -t continuumio/miniconda3:latest -t continuumio/miniconda3:4.5.11
#  $ docker run --rm -it continuumio/miniconda3:latest /bin/bash
#  $ docker push continuumio/miniconda3:latest
#  $ docker push continuumio/miniconda3:4.5.11

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]

# installing requirements
#RUN git clone https://github.com/Saskia-Oosterbroek/decona.git

# apt update
#RUN apt update && \
#    apt install g++ && \
#    apt install zlib1g-dev &&\
#    apt install make && \
#    apt-get install dos2unix && \
#    conda update -n base -c defaults conda

#http://circos.ca/documentation/tutorials/configuration/installation/
#(base) root@3a349d66fca6:/# ls
#bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
#(base) root@3a349d66fca6:/# mkdir software
#(base) root@3a349d66fca6:/# ls
#bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  software  srv  sys  tmp  usr  var
#(base) root@3a349d66fca6:/# mkdir software/circos
#(base) root@3a349d66fca6:/# ls
#bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  software  srv  sys  tmp  usr  var
#(base) root@3a349d66fca6:/# cd software/circos
#(base) root@3a349d66fca6:/software/circos# ls
#(base) root@3a349d66fca6:/software/circos# pwd
#/software/circos
#(base) root@3a349d66fca6:/software/circos# tar xvfz circos-0.69-9.tgz
#(base) root@3a349d66fca6:/software/circos# ln -s circos-0.69-9 current
#(base) root@3a349d66fca6:/software/circos# ls
#circos-0.69-9  circos-0.69-9.tgz  current
#(base) root@3a349d66fca6:/software/circos#
#bin  폴더에서만 circos 실행됨. 그리고 './'를 앞에 붙여야지만 작동됨!! 
#(base) root@92d0131c6757:/software/circos/current/bin# ./circos -modules
#(base) root@92d0131c6757:/software/circos/current/bin# ./circos -version
#circos | v 0.69-8 | 15 Jun 2019 | Perl 5.034000
#(base) root@6972a5fd906e:/software/circos/current/bin# ./circos -version
#circos | v 0.69-8 | 15 Jun 2019 | Perl 5.034000
#(base) root@6972a5fd906e:/software/circos/current/bin# export PATH=~/software/circos/current/bin:$PATH.
#(base) root@6972a5fd906e:/software/circos/current/bin# export PATH=~/software/circos/current/bin:$PATH
#(base) root@6972a5fd906e:/software/circos/current/bin# . ~/.bashrc
#(base) root@6972a5fd906e:/software/circos/current/bin# . ~/.bash_profile
#bash: /root/.bash_profile: No such file or directory
#(base) root@6972a5fd906e:/software/circos/current/bin# echo $PATH
#/root/software/circos/current/bin:/root/software/circos/current/bin:/opt/conda/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin.
#(base) root@6972a5fd906e:/software/circos/current/bin# cd ~
#(base) root@6972a5fd906e:~# echo $PATH
#/root/software/circos/current/bin:/root/software/circos/current/bin:/opt/conda/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin.
#(base) root@6972a5fd906e:~# which circos
#(base) root@6972a5fd906e:~# ./which circos
#bash: ./which: No such file or directory
#(base) root@6972a5fd906e:~# pwd
#/root
#(base) root@6972a5fd906e:~# cd /
#(base) root@6972a5fd906e:/# pwd
#/
#(base) root@6972a5fd906e:/# ls
#bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  software  srv  sys  tmp  usr  var
#(base) root@6972a5fd906e:/# cd software
#(base) root@6972a5fd906e:/software# ls
#circos
#(base) root@6972a5fd906e:/software# cd circos
#(base) root@6972a5fd906e:/software/circos# ls
#circos-0.69-9  circos-0.69-9.tgz  current
#(base) root@6972a5fd906e:/software/circos# cd current
#(base) root@6972a5fd906e:/software/circos/current# ls
#CHANGES   INSTALL  README        README.tutorials  SUPPORT  bin   error  example  gddiag.png  tiles
#CITATION  LICENSE  README.tools  README.windows    TODO     data  etc    fonts    lib
#(base) root@6972a5fd906e:/software/circos/current# cd bin
#(base) root@6972a5fd906e:/software/circos/current/bin# ls
#circos  circos.exe  compile.bat  compile.make  gddiag  list.modules  test.modules
#(base) root@6972a5fd906e:/software/circos/current/bin# pwd
#/software/circos/current/bin
#(base) root@6972a5fd906e:/software/circos/current/bin# export PATH=/software/circos/current/bin:$PATH
#(base) root@6972a5fd906e:/software/circos/current/bin# cd ~
#(base) root@6972a5fd906e:~# echo $PATH
#/software/circos/current/bin:/root/software/circos/current/bin:/root/software/circos/current/bin:/opt/conda/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin.
#(base) root@6972a5fd906e:~# ./which circos
#bash: ./which: No such file or directory
#(base) root@6972a5fd906e:~# which circos
#/software/circos/current/bin/circos
#(base) root@6972a5fd906e:~#

#https://dohk.tistory.com/191
#일반적으로 전역적인 파일은 /etc 디렉토리에 위치한다. 
#> > . ~/.bashrc or > . ~/.bash_profile

#vi 편집기 (vim) 사용 필요!! [Linux] - 리눅스 - 셸, 환경변수, bash 셸
#https://ts2ree.tistory.com/81
#> apt-get update
#> apt-get install vim
#> vi .bash_profile
#절대경로 지정은 가능함, 그러나 도커 이미지로는 저장되지 않음, 그래서 상대경로로 파일 실행!! 따라서 각 개인 컴퓨터에 개별로 초기에 설정 필요!!

#running the command
#> circos -conf /software/circos/current/example/etc/circos.conf
#(base) root@901d364a28cd:/software/circos/current/example/etc# circos -conf /software/circos/current/example/etc/circos.conf
#위의 경로에 그림파일이 만들어짐. 중간에 uninitialized value 경고가 뜨지만, 그림이 제대로 만들어짐. 
