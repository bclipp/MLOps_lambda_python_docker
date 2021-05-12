FROM amazon/aws-lambda-python

RUN pip install awslambdaric

COPY app/__main__.py   ./

CMD ["__main__.handler"]