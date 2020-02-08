Python environment setup script
=====

## Overview
This script sets up below:

- Pyenv
- Pyenv-virtualenv
- Create new virtual environment
- Python 3.6.5
- python packages: ex) numpy, pandas, etc...

## 概要
このスクリプトはLinuxにPythonによる機械学習環境(chainer, OpenCV)を構築するためのスクリプトである．具体的には以下の操作が行われる．

なお，Windows Subsystem for Linux (WSL) でも動作の確認中．環境によっては必要なパッケージをaptで要インストール．

- pyenv + pyenv_virtualenvのインストールとセットアップ
- python3.6.5のインストール
- python3.6.5におけるchainer用環境をvirtualenvで構築
- jupyterを入れるのでVSCodeのPython拡張機能があればJupyter Notebook形式でPythonを扱える
- 構築した環境を全体に適用
- pipで必要となりそうなパッケージをインストール

## インストールパッケージ一覧
- numpy
- six
- matplotlib
- pandas
- opencv-python
- opencv-contrib-python
- Pillow
- jupyter
- 上記に依存するパッケージ（pipで自動的にインストールされる)

## 使いかた
このリポジトリをダウンロードし，setup_env.shを実行する．
pyenvで環境が構築されるので，その環境につけたい名前を引数に与える．

ユーザ権限で実行すること．sudoはつけない．

```sh
$ ./setup_env.sh your_env_name
$ source ~/.bashrc
```
これで全て必要な環境が準備される．確認は，pythonと端末に入力し，python3.6.5が起動すればOK．

## おことわり
本スクリプトはエラー処理を行っていない．何らかの問題でエラー終了した場合は，~/.pyenvを削除し，~/.bashrcをもとに戻す必要がある．
このスクリプトで生じた事象の一切の責任を作者はおいませんので，自己責任でご利用ください．

## 他のpythonバージョンがほしいとき
スクリプト内の"PYTHON_VERSION"を所望のバージョンに変更すれば良い．ただし，pyenvでインストールできるバージョンに限る．