# Graduates

The graduates endpoint is hosted on the `/graduates` path.

## Create a Graduate

<aside class="notice">
This endpoint should be used when a graduate who has never submitted a survey before wishes to contribute to a survey. It will return their name and graduate_id if successful.
</aside>

### HTTP Request

`POST http://example.com/graduates`

## Get a Graduate

<aside class="notice">
This endpoint should be used to verify that a graduate exists after they have given you their name and to recover their graduate_id which is then used to associate survey data with their anonymous profile.
</aside>

### HTTP Request

`GET http://example.com/graduates/:name`
