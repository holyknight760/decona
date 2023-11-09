# Dockerfile
# My first docker project(image)!

# Version Info :
# Ruby : 2.7.4
# Node : 14.17.4
# Bootstarp : 5.0.2

FROM ubuntu:22.04

# apt update
RUN apt update

# installing requirements
RUN git clone https://github.com/Saskia-Oosterbroek/decona.git

