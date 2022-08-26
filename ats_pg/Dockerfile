FROM postgres:14

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
COPY ./ninenine-delta-test.sql /docker-entrypoint-initdb.d/

EXPOSE 5432:5432