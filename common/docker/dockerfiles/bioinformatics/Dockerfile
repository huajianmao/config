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
      && conda create -n alignment samtools bwa tablet seqtk \
      && conda create -n binning maxbin2 openjdk \
      && conda create -n taxonomy metaphlan2 kraken mash \
      && conda create -n qc fastqc cutadapt seqtk fqtrim seqkit \
      # && conda create -n mcheck checks-genome \
      && conda create -n contigs megahit \
      && conda clean --all --yes

# bwa samtools macs2
# hisat2 samtools sra-tools
# htseq-count
# fastqc trimmomatics

