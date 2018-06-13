# dynamodb-local-docker

## build
```
$ docker build -t dynamodb-local .
```

## run
```
$ docker run -d -p 8080:8000 dynamodb-local
```

## check
```
$ aws dynamodb list-tables --endpoint-url http://localhost:8080
{
    "TableNames": []
}
```
