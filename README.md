# Marvel Heroes Web

So this project was born out of the fact that it is really hard to create an MD5 hash in iOS. Which seems stupid but I like throwing together little projects like this.

So the long and short of it is this: the Marvel API requires a handful of query parameters syntehsized from your public and private keys that are tied to your account and the synthesis requires creating an MD5 hash which is hard in iOS. So this web app acts like a proxy between the Marvel API and your application so you can register with your public/private key and this will generate a simple token to that you can put in your applicaiton.

### Marvel API

    curl ...

### Proxied API

    curl ...

It's that simple. Enjoy!