DB_URL=postgresql://postgres:postgres@localhost:5432/simplebank?sslmode=disable

up:
	docker-compose up -d --build

down:
	docker-compose down

clean:
	docker system prune --volumes

migrateup:
	migrate -path database/migrations -database "$(DB_URL)" -verbose up

migratedown:
	migrate -path database/migrations -database "$(DB_URL)" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...
