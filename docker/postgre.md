# docker-compose.yml:

version: "3"
services:
  db:
    image: "postgres:13"
    container_name: "my_postgres"
    environment:
      POSTGRES_PASSWORD: "my_password"
    ports:
      - "54320:5432"
    volumes:
      - my_dbdata:/var/lib/postgresql/data
volumes:
  my_dbdata:
  
#see logs:
docker logs -f my_postgres
#exit : ctrl + D

# run psql:

docker exec -it my_postgress  psql -U postgres

# create database

docker exec -it my_postgress  psql -U postgres -C "create database my_database"

#Connect using Python and psycopg2 

python -m venv nyenv
source myenv/bin/activate
pip install psycopg2-binary

# myscript.py to connent psql

import psycopg2

conn = psycopg2.connect(
    host='localhost',
    port=54320,
    dbname='my_database',
    user='postgres',
    password='my_password',
)
cur = conn.cursor()

cur.execute("CREATE TABLE IF NOT EXISTS test (id serial PRIMARY KEY, num integer, data varchar);")

cur.execute("INSERT INTO test (num, data) VALUES (%s, %s)", (100, "abcdef"))

cur.execute("SELECT * FROM test;")

result = cur.fetchone()

print(result)

conn.commit()

cur.close()

conn.close()

# run 
python mysript.py

    
 
