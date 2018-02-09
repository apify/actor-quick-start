# apify/quick-start

This is a simple Apify act that contains the basic boilerplate
that you need when creating a new act hosted in a Git repository.
Fill free to copy it, change it and use it in your acts.

Are you missing anything? Something not clear? Please let us know at support@apify.com

To run the act in your local environment, simply run the following commands:

```bash
npm install
npm run test-local
```

In order to test the build of the Docker image, run:

```
docker build ./
```

On success, the command will produce something like:

```
...
Removing intermediate container 22915a918e4c
Step 6/6 : CMD node main.js
 ---> Running in 7288f9a12cf0
 ---> 0d82ea8a648d
Removing intermediate container 7288f9a12cf0
Successfully built XYZ
```

After that you can run the built Docker image locally using:

```bash
docker run -e "APIFY_DEV_KEY_VALUE_STORE_DIR=./kv-store-dev/" XYZ
```

Where `XYZ` is ID of the Docker image built in the previous step.
Please see below for a detailed description of the `APIFY_DEV_KEY_VALUE_STORE_DIR`
environment variable.

If there is any problem with the built image, you might try troubleshooting it
by starting the container in interactive mode using:

```
docker run -it XYZ /bin/bash
```

Note that this requires a base Docker image that contains bash or some other interactive shell.



## main.js

Contains the source code of the act in Node.js 7+.

## package.json

The file used by NPM to maintain meta-data about the package, such as list of dependencies.
See [NPM docs](https://docs.npmjs.com/files/package.json) for more details.

## Dockerfile

Contains instructions for Docker how to build the image for the act.
For more information, see [Dockerfile reference](https://docs.docker.com/engine/reference/builder/).

## README.md

The readme file is used to generate a long description of the act that is displayed in the
[Apify library](https://www.apify.com/apify/quick-start) as well as on the project's
[GitHub page](https://github.com/apifytech/act-quick-start).

## kv-store-dev

When running the act on the Apify cloud, the act is automatically assigned
a key-value store that is used to store act's input, output or any other data.
The `kv-store-dev` directory is used to emulate the key-value store
during local development of your act.
The files in the directory represent the records in the key-value store - the name
of each file corresponds to its key and the content to the value.

For example, calling `Apify.getValue('INPUT')` will return the content
of the `kv-store-dev/INPUT` file parsed as JSON. Similarly, calling
`Apify.setValue('OUTPUT', ...)` will write a file to `kv-store-dev/OUTPUT`.

To make this work, the reference to the `kv-store-dev` directory must be passed to the act process
as the `APIFY_DEV_KEY_VALUE_STORE_DIR` environment variable.
You can achieve that by starting the act using the following command:

```bash
npm run test-local
```

When reading the files from the directory, the `Apify.getValue()` function
assumes they have `application/json` content type and parses them to JSON.
If you want use a different content type, please set also
the `APIFY_DEV_KEY_VALUE_STORE_CONTENT_TYPE` environment variable.

For more information, see the
[apify NPM package documentation](https://www.apify.com/docs/sdk/apify-runtime-js/latest#module-Apify-getValue).
