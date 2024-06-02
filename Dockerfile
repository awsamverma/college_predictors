FROM python:3.12.3-slim as collegepredictor
WORKDIR /collegepredictor
COPY requirements.txt /collegepredictor/
RUN pip install -r requirements.txt
ENV FLASK_ENV=development
ENV FLASK_APP=run.py

COPY . /collegepredictor/
FROM python:3.12.3-slim as appcollegepredictor
WORKDIR /collegepredictor
COPY --from=collegepredictor /collegepredictor /collegepredictor
CMD ["python", "app.py"]




