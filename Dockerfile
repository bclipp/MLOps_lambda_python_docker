FROM amazon/aws-lambda-python

RUN pip install awslambdaric

COPY app/__main__.py   ./
COPY model ./
COPY Pipfile ./
COPY Pipfile.lock ./

RUN pip install pipenv \
    && pipenv sync

CMD ["__main__.handler"]