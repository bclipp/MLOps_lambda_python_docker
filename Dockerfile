FROM amazon/aws-lambda-python

RUN pip install awslambdaric

COPY app/__main__.py   ./
COPY model ./
COPY Pipfile ./
COPY Pipfile.lock ./
COPY startup.sh ./
COPY requirements.txt ./

RUN yum install -y gcc \
    && pip install -r requirements.txt --no-cache-dir
#RUN yum install -y gcc \
#    && pip install pipenv \
#    && pipenv install


CMD ["__main__.handler"]
# CMD startup.sh