FROM ubuntu:20.04
LABEL maintainer="huajianmao@gmail.com"
RUN apt-get update && apt-get install -qq -y curl bzip2 \
      && curl -sSL https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
      && bash /tmp/miniconda.sh -bfp /usr/local \
      && rm -rf /tmp/miniconda.sh \
      && conda install -y python=3 \
      && conda update -y conda \
      && apt-get -qq -y remove curl bzip2 \
      && apt-get -qq -y autoremove \
      && apt-get autoclean \
      && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
      && conda clean --all --yes \
      \
      && conda config --add channels defaults \
      && conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ \
      && conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/ \
      && conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/ \
      && conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/ \
      && conda config --set show_channel_urls yes \
      \
      # @ https://angelmojarro.com/bioinformatics
      && conda create -n rnaseq -y samtools bwa tablet seqtk \
                                   maxbin2 openjdk \
                                   metaphlan2 kraken mash \
                                   fastqc cutadapt seqtk fqtrim seqkit \
                                   checkm-genome \
                                   megahit \
                                   sra-tools trimmomatic bowtie2 cufflinks \
                                   macs2 hisat2 htseq \
                                   tophat \
      && conda clean --all --yes

# Install ibm aspera connect
# https://download.asperasoft.com/download/sw/connect/3.9.9/ibm-aspera-connect-3.9.9.177872-linux-g2.12-64.tar.gz
# tar zxvf aspera-connect-3.7.4.147727-linux-64.tar.gz
# bash aspera-connect-3.7.4.147727-linux-64.sh
# echo 'export PATH=~/.aspera/connect/bin:$PATH' >> ~/.bashrc
# source ~/.bashrc   
# cp ~/.aspera/connect/etc/asperaweb_id_dsa.openssh ~/
