#!/bin/bash

apt update
apt upgrade -y
apt install -y golang

rm -rf api
git clone https://github.com/tune-bot/api.git
cd api
go run . &