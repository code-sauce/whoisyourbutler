# whoisyourbutler
Choosing the right CI/CD tool

Performs similar operations on different CI/CDs. 
Currently evaluating:

* CircleCI
* Travis-CI
* Codeship

Since we already use Jenkins, evaluating it will not be very useful.

Evaluation criteria:

* Automated tests on Github commits
* Support multiple versions of environment etc.
* Deployment features like putting an artifact into S3 (on a private AWS account)
* node tests, optionally a UI headless browser test
* Docker support

* Secrets management:
  Travis CI generates a public/private key pair and asks the user to encrypt using the public key using Travis CLI 
  and put the encrypted value in the config, which is used by travis to decrypt in the Travis backend.
  I don't think Circle CI has an asymmetric key option.

  To set secret environment variables in `.travis.yml`:
  
  ```
  gem install travis
  gem install travis encrypt SOMEVAR="secretvalue"
  ```

  This will generate something like:

  ```secure: "VZRRcfBU9kISDPRUjT0yJdHHOM2Op3rwEt9FlnLXYHb9lucpxZlIj7ejhM36jjrVRQ6cHS/szydGcW0Y```

  that you can add to `.travis.yml` and the environment variable `SOMEVAR` will be available after being decrypted from the Travis Servers.

  There are options to encrypt the secrets files: https://docs.travis-ci.com/user/encrypting-files/

  


