#!/bin/bash

APP=srs
GROUP=root
USER=root
SYSD=/etc/systemd/system
SERFILE=srs.service

initialize() {
  egrep "^$GROUP" /etc/group >/dev/null
  if [[ $? -ne 0 ]]; then
    groupadd -r $GROUP
  fi

  egrep "^$USER" /etc/passwd >/dev/null
  if [[ $? -ne 0 ]]; then
    useradd -r -g $GROUP -s /usr/sbin/nologin -M $USER
  fi

  if [[ ! -d /opt/$APP/log ]]; then
    mkdir /opt/$APP/log
    chmod 755 /opt/$APP/log
  fi

  if [[ ! -s $SYSD/$SERFILE ]]; then
    ln -s /opt/$APP/setup/$SERFILE $SYSD/$SERFILE
    echo "($APP) create symlink: $SYSD/$SERFILE --> /opt/$APP/setup/$SERFILE"
  fi

  chown -R $GROUP:$USER /opt/$APP
  systemctl enable $SERFILE
  systemctl daemon-reload
}

deinitialize() {
  egrep "^$USER" /etc/passwd >/dev/null
  if [[ $? -eq 0 ]]; then
    userdel $USER
  fi

  egrep "^$GROUP" /etc/group >/dev/null
  if [[ $? -eq 0 ]]; then
    groupdel $GROUP
  fi

  systemctl disable $SERFILE
  systemctl daemon-reload
  chown -R root:root /opt/$APP

  if [[ -d /opt/$APP/log ]]; then
    rm -rf /opt/$APP/log
    echo "($APP) delete /opt/$APP/log"
  fi

  if [[ -s $SYSD/$SERFILE ]]; then
    rm -rf $SYSD/$SERFILE
    echo "($APP) delete symlink: $SYSD/$SERFILE"
  fi
}

show() {
  ps -ef | grep $APP | grep -v 'grep'
}

case "$1" in
  init)
    initialize
    ;;
  deinit)
    deinitialize
    ;;
  show)
    show
    ;;
  *)
    SCRIPTNAME="${0##*/}"
    echo "Usage: $SCRIPTNAME {init|deinit|show}"
    exit 1
    ;;
esac

exit 0

# vim: syntax=sh ts=4 sw=4 sts=4 sr noet
