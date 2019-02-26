FROM python:3-slim AS bytecompile

# Using standard Python image
#  Add in the application code
#  Byte-compile Python code to *.pyc

ADD . /app
WORKDIR /app
RUN python -m compileall .

# Copy the results into the distroless image.

FROM gcr.io/distroless/python3 AS compiled
COPY --from=bytecompile /app /app
WORKDIR /app
CMD ["hello.py", "/etc"]

FROM python:3-slim AS pip
ADD . /app
WORKDIR /app
RUN pip3 install -r requirements.txt -t /app
RUN python -m compileall .

FROM gcr.io/distroless/python3 AS withrequirements
COPY --from=pip /app /app
WORKDIR /app
CMD ["hello.py", "/etc"]

