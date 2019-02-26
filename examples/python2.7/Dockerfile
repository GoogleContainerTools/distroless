FROM python:2.7-slim AS bytecompile
# Using standard Python image
#  Add in the application code
#  Byte-compile Python code to *.pyc
ADD . /app
WORKDIR /app
RUN python -m compileall .


FROM gcr.io/distroless/python2.7 AS compiled
COPY --from=bytecompile /app /app
WORKDIR /app
CMD ["hello.py", "/etc"]

FROM python:2.7-slim AS pip
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt -t /app
RUN python -m compileall .

FROM gcr.io/distroless/python2.7 AS withrequirements
COPY --from=pip /app /app
WORKDIR /app
CMD ["hello.py", "/etc"]

