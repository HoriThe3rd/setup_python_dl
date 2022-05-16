Python environment setup script
=====

## Overview
pyenvとpyenv virtualenvによる複数バージョンのPythonおよび，複数のPython環境を使えるようにするためのスクリプト．
本スクリプトを実行すると，使用環境全体に対して指定したバージョンのPythonが設定される．

## インストールパッケージ一覧
requirements.txtを参照．

## 使いかた
以下のスクリプトを実行する．
- setup_env.sh: pyenv, pyenv-virtualenvのインストールとセットアップ．

ユーザ権限で実行すること．sudoはつけない．
`<python version>`にはインストールしたいPythonバージョン番号を入力．`<virtualenv name>`には実験用環境名として任意の名前をつける（半角英数）．

なお，新しいバージョンのUbuntuを使用している場合，インストールするPythonのバージョンが古すぎるとインストールエラーが発生するので注意．

```sh
$ ./setup_env.sh <python version> <virtualenv name>
```
完了したらターミナルを再起動する．
これで全て必要な環境が準備される．Pythonを起動して，指定したバージョンが立ち上がればインストール成功．

## おことわり
本スクリプトはエラー処理を行っていない．何らかの問題でエラー終了した場合は，~/.pyenvを削除し，~/.bashrcをもとに戻す必要がある．
このスクリプトで生じた事象の一切の責任を作者はおいませんので，自己責任でご利用ください．