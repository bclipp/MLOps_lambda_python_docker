FROM amazon/aws-lambda-python

RUN pip install awslambdaric

COPY app/lambda_function.py   ./
COPY model ./
COPY Pipfile ./
COPY startup.sh ./

RUN yum install -y gcc \
    && pip3 install pipenv \
    && pipenv install \
    && pipenv run pip3 freeze > requirements.txt \
    && pip3 install -r requirements.txt --no-cache-dir


CMD ["lambda_function.handler"]
