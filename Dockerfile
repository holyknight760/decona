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
#Vim에서 작업을 저장하고 재부팅 후에도 그대로 유지하려면 Vim의 세션 기능을 사용할 수 있습니다. Vim 세션은 현재 Vim 환경(열린 창, 탭, 버퍼 등)을 저장하고 나중에 다시 로드할 수 있게 해줍니다. 아래는 Vim 세션을 저장하고 복원하는 방법입니다:

#1. Vim에서 작업 중인 파일을 저장하려면 먼저 명령 모드로 전환해야 합니다. 이를 위해 `Esc` 키를 누릅니다.
#2. 이제 콜론(`:`)을 누르세요. 이렇게 하면 창의 왼쪽 하단에 프롬프트 바가 열립니다.
#3. 콜론 뒤에 `w`를 입력하고 `Enter`를 누르세요. 이렇게 하면 Vim에서 파일의 변경 사항을 저장하지만 Vim은 종료되지 않습니다¹.

#세션을 저장하려면 다음과 같이 하세요:

#1. 명령 모드로 전환합니다(`Esc` 키를 누르세요).
#2. 콜론(`:`)을 누르고 `mksession session.vim`을 입력한 후 `Enter`를 누릅니다².

#이제 Vim 세션을 저장했습니다. 컴퓨터를 재부팅 한 후에 Vim 세션을 복원하려면 다음과 같이 하세요:

#1. 터미널을 열고 `vim -S session.vim`을 입력하세요².

#이렇게 하면 Vim이 이전에 저장한 세션을 로드하고, 이전에 열려 있던 파일들이 그대로 열립니다². 이 방법을 사용하면 Vim을 재시작해도 작업이 초기화되지 않습니다. 

#1. Vim을 열고 새 파일을 생성합니다. 이를 위해 터미널에서 `vim filename.sh`를 입력하세요.
#2. Vim 편집기가 열리면, 다음과 같이 입력하세요:

#	#!/bin/bash
#	export PATH=/software/circos/current/bin:$PATH

#3. 파일을 저장하려면 `Esc` 키를 눌러 명령 모드로 전환한 후, `:wq`를 입력하고 `Enter`를 누르세요¹.

#이제 `filename.sh` 스크립트 파일이 생성되었습니다. 이 파일을 어디서든 실행하려면, 파일에 실행 권한을 부여해야 합니다. 이를 위해 터미널에서 다음 명령을 입력하세요:

#	chmod +x filename.sh

#이제 이 스크립트는 절대 경로를 사용하여 어디서든 실행할 수 있습니다. 스크립트를 실행하려면 터미널에서 `./filename.sh`를 입력하세요.

#참고로, 이 스크립트는 현재 세션에서만 `PATH` 환경 변수를 변경합니다. 이 변경사항을 영구적으로 적용하려면, 
#스크립트의 내용을 `~/.bashrc` 또는 `~/.bash_profile` 파일에 추가해야 합니다. 이렇게 하면 새 터미널 세션을 시작할 때마다 스크립트가 자동으로 실행됩니다. 

#1. Vim을 열고 `~/.bashrc` 또는 `~/.bash_profile` 파일을 편집합니다. 이를 위해 터미널에서 `vim ~/.bashrc` 또는 `vim ~/.bash_profile`를 입력하세요.
#2. Vim 편집기가 열리면, 파일의 마지막에 다음과 같이 입력하세요:
#    ```bash
#    export PATH=/software/circos/current/bin:$PATH
#    ```
#3. 파일을 저장하려면 `Esc` 키를 눌러 명령 모드로 전환한 후, `:wq`를 입력하고 `Enter`를 누르세요.
#:q!_vim 저장하지 않고 종료하기!!

#이제 새 터미널 세션을 시작할 때마다 `PATH` 환경 변수가 자동으로 변경됩니다. 
#`~/.bashrc` 파일은 실행되는 것이 아니라 소스로 로드되는 것입니다. 따라서 `Permission denied` 오류가 발생하는 것은 이 파일을 실행하려고 했기 때문입니다¹. 

#source ~/.bashrc 또는 . ~/.bashrc

#이렇게 하면 `~/.bashrc` 파일이 소스로 로드되며, 이 파일에 정의된 환경 변수와 함수가 현재 쉘 세션에 적용됩니다.

#만약 `~/.bashrc` 파일을 편집하려면, 텍스트 편집기를 사용하여 파일을 열어야 합니다. 예를 들어, Vim을 사용하려면 다음과 같이 입력하세요:

#vim ~/.bashrc

#running the command
#> circos -conf /software/circos/current/example/etc/circos.conf
#(base) root@901d364a28cd:/software/circos/current/example/etc# circos -conf /software/circos/current/example/etc/circos.conf
#위의 경로에 그림파일이 만들어짐. 중간에 uninitialized value 경고가 뜨지만, 그림이 제대로 만들어짐. 
