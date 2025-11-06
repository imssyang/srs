# srs

```bash
$ cd srs-6.0-b3/trunk
$ ./configure --prefix=/opt/srs \
  --config=/opt/srs/conf/srs.conf \
  --https=on \
  --srt=on \
  --rtc=on \
  --gb28181=on \
  --cxx11=on \
  --cxx14=on \
  --ffmpeg-fit=on \
  --ffmpeg-opus=on \
  --h265=on \
  --nasm=on \
  --srtp-nasm=on
$ make -j8
The build summary:
     +------------------------------------------------------------------------------------
     For SRS benchmark, gperf, gprof and valgrind, please read:
          https://www.jianshu.com/p/6d4a89359352
     +------------------------------------------------------------------------------------
     |The main server usage: ./objs/srs -c conf/srs.conf, start the srs server
     |     About HLS, please read https://ossrs.net/lts/zh-cn/docs/v4/doc/delivery-hls
     |     About DVR, please read https://ossrs.net/lts/zh-cn/docs/v4/doc/dvr
     |     About SSL, please read https://ossrs.net/lts/zh-cn/docs/v4/doc/rtmp-handshake
     |     About transcoding, please read https://ossrs.net/lts/zh-cn/docs/v4/doc/ffmpeg
     |     About ingester, please read https://ossrs.net/lts/zh-cn/docs/v4/doc/ingest
     |     About http-callback, please read https://ossrs.net/lts/zh-cn/docs/v4/doc/http-callback
     |     Aoubt http-server, please read https://ossrs.net/lts/zh-cn/docs/v4/doc/http-server
     |     About http-api, please read https://ossrs.net/lts/zh-cn/docs/v4/doc/http-api
     |     About stream-caster, please read https://ossrs.net/lts/zh-cn/docs/v4/doc/streamer
     |     (Disabled) About VALGRIND, please read https://github.com/ossrs/state-threads/issues/2
     +------------------------------------------------------------------------------------
binaries, please read https://ossrs.net/lts/zh-cn/docs/v4/doc/install
You can:
      ./objs/srs -c conf/srs.conf
                  to start the srs server, with config conf/srs.conf.

$ make install
$ ln -s /opt/srs/objs/srs /opt/srs/bin/srs
$ mv /opt/srs/usr/lib/systemd/system/srs.service setup; rm -rf /opt/srs/usr
```

