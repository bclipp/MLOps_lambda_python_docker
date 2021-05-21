FROM amazon/aws-lambda-python

RUN pip install awslambdaric

COPY app/lambda_function.py   ./
COPY model ./
COPY Pipfile ./
COPY Pipfile.lock ./
COPY startup.sh ./

RUN yum install -y gcc \
    && pip install pipenv \
    && pipenv install \
    && pip freeze > requirements.txt \
    && pip install -r requirements.txt --no-cache-dir


CMD ["lambda_function.handler"]
# CMD startup.sh