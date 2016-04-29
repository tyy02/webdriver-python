# Webdriver-python
A Docker image includes python 2.7, selenium 2.52.0 and firefox 45.0.2. It uses Firefox as the driver. [Dockerfile](https://github.com/tyy02/webdriver-python/blob/master/Dockerfile)

# Run image
There are two test cases in the main.py test file and each case tests a keyword searching in www.baidu.com.

We import the module unittest, when finish the two test cases, you will get the result. "." presents the PASS.

$ docker run tyy02/webdriver-python

# Customize

Use the RESOLUTION environmental variable to customize screen size and depth. The default is "1024x768x24". For example:

$ docker run -e RESOLUTION=1920x1600x24 tyy02/webdriver-python
