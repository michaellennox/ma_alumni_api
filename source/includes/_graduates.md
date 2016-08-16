# Graduates

The graduates endpoint is hosted on the `/graduates` path.

## Create a Graduate

> Example Request

```
POST /graduates HTTP/1.1
Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
```
```json
{
  "data": {
    "type": "graduate",
    "attributes": {
      "name": "Flying Dinosaur",
      "gender": "dinosaur",
      "age": 598,
      "cohort": "2016-09-01",
      "years_experience_pre_makers": 92
    },
    "relationships": {
      "photographer": {
        "data": { "type": "people", "id": "9" }
      }
    }
  }
}
```

> The above request will give the following response if successful

```
HTTP/1.1 201 Created
Location: http://example.com/graduates/1
Content-Type: application/vnd.api+json
```
```json
{
  "jsonapi": {
    "version": "1.0"
  },
  "data": {
    "type": "graduate",
    "id": "1",
    "attributes": {
      "name": "Flying Dinosaur"
    }
  }
}
```

This endpoint should be used when a graduate who has never submitted a survey before wishes to contribute to a survey. It will return their name and graduate_id if successful.

<aside class="warning">
Please note this endpoint is not JSON API compliant, the Location header returned will be non-functional as we don't wish for you to be able to recover the graduate name from a user ID.
</aside>

### HTTP Request

`POST http://example.com/graduates`

### Body Parameters

| Key | Required | Description |
|-----|----------|-------------|
| name | true | The graduate's first and last name with the first letters capitalised, eg. 'Bob Jenkins' |
| gender | true | The graduate's gender |
| age | true | The graduate's age in years |
| cohort | true | The graduate's Makers cohort formatted as "YYYY-MM-DD" or a JSON serialized javascript date object, the day should always be 01 no matter when in the month the cohort started |
| years_experience_pre_makers | true | The years of experience in the workplace prior to starting at Makers |

## Get a Graduate

> Example Request

```
GET /graduates/Flying%20Dinosaur HTTP/1.1
Accept: application/vnd.api+json
```

> The above request will give the following response if Flying Dinosaur is in the DB

```
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json
```
```json
{
  "jsonapi": {
    "version": "1.0"
  },
  "data": {
    "type": "graduate",
    "id": "1",
    "attributes": {
      "name": "Flying Dinosaur"
    }
  }
}
```

This endpoint should be used to verify that a graduate exists after they have given you their name and to recover their graduate_id which is then used to associate survey data with their anonymous profile.

### HTTP Request

`GET http://example.com/graduates/:name`

### Returned Metadata

| Key | Description |
|-----|-------------|
| type | the object type, always "graduate" |
| id | the database ID of the graduate, must be used when submitting a form for that graduate |

### Returned Attributes

| Key | Description |
|-----|-------------|
| name | The graduate's first and last name |
