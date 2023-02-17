# Run this file to create the database and tables in docker
postgres:
	docker run --name $(container_name) -e POSTGRES_PASSWORD=$(db_password) -d -p $(db_port):5432 postgres:latest
createdb:
	docker exec -it $(container_name) createdb --username=$(db_user) --owner=$(db_user) $(db_name)

dropdb:
	docker exec -it $(container_name) dropdb $(db_name)

migrateup:
	migrate -path db/migration -database "postgresql://postgres:root@localhost:5432/godb?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:root@localhost:5432/godb?sslmode=disable" -verbose down
	
.PHONY:postgres createdb dropdb migrateup migratedown