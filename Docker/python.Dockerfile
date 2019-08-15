FROM python:latest

RUN echo 'PS1="\\[\\033[07;37m\\]git@Docker \\w \\$ \\[\\033[00m\\]"' >> ~/.bashrc

WORKDIR /project
