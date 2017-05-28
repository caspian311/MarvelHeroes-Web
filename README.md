# Marvel Heroes Web

So this project was born out of the fact that it is really hard to create an MD5 hash in iOS. Which seems stupid but I like throwing together little projects like this.

So the long and short of it is this: the [Marvel API](https://developer.marvel.com/documentation/authorization) requires a handful of query parameters syntehsized from your public and private keys that are tied to your account and the synthesis requires creating an MD5 hash which is hard in iOS. So this web app acts like a proxy between the Marvel API and your application so you can register with your public/private key and this will generate a simple token to that you can put in your applicaiton.

### Marvel API

    PRIVATE_KEY=abc
    PUBLIC_KEY=123
    TS=$(date +%s)
    HASH=$(echo "$TS$PRIVATE_KEY$PUBLIC_KEY" | md5)
    curl -H 'Content-Type: application/json' https://gateway.marvel.com/v1/characters/1009368?ts=$TS&apikey=$PUBLIC_KEY&hash=$HASH

### Proxied API

    curl -H 'Content-Type: application/json' -H 'Authorization: Token token=ef572f4a73e45544d310f43f04e79b36' http://marvel-heroes.lvh.me:3000/api/characters/1009368

It's that simple. Enjoy!