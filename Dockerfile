#使用官方python2.7基础包
FROM python:2.7

#provide the author info
MAINTAINER yytan(yytan@isoftstone.com)

#安装Firefox, 手动从 http://download.firefox.com.cn/releases/firefox/45.0/en-US/Firefox-latest-x86_64.tar.bz2 下载
COPY firefox.tar.bz2 /firefox.tar.bz2
RUN \
	tar xvf firefox.tar.bz2 && \
	rm firefox.tar.bz2

#安装软件包
RUN apt-get update 
RUN apt-get install -y \
	# Headless browser support
	xvfb \
	# Needed to lauch firefox
	libasound2 \
	libgtk2.0-0 \
	libdbus-glib-1-2 \
	libxcomposite1
	
#安装selenium
RUN pip install pyyaml==3.11 requests==2.5.1 selenium==2.53.2

#复制测试脚本文件
COPY shell /

#设置环境变量
ENV PYTHONPATH /

#设置进入点，窗口启动后会先执行
ENTRYPOINT [ "/entrypoint.sh" ]

#默认运行脚本main.py
CMD ["python", "-u", "/main.py"]
