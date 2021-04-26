Python environment setup script
=====

## Overview
pyenv + pyenv-virtualenvをインストールするスクリプトと，自分用の環境を作るためのスクリプト．

## インストールパッケージ一覧
requirements.txtを参照．

## 使いかた
- setup_env.sh: pyenv, pyenv-virtualenvのインストールとセットアップ．
- create-mypyenv.sh: pyenvによるPythonインストールとpyenv-virtualenvで環境作成．

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