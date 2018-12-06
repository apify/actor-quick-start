This is a simple Apify actor that contains the basic boilerplate
using a custom Dockerfile and hosted in a Git repository.
Fill free to copy it, change it and use it in your own actors.

Are you missing anything? Something not clear? Please let us know at support@apify.com

To run the actor in your local environment, simply run the following commands:

```bash
npm install
npm run start
```

Alternatively, if you have [Apify CLI](https://www.apify.com/docs/cli) installed, you can start the actor by running:

```bash
apify run
```

In order to test the build of the Docker image, run:

```
docker build ./
```

On success, the command will print something like:

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
docker run XYZ
```

Where `XYZ` is ID of the Docker image built in the previous step.

If there is any problem with the built image, you might try troubleshooting it
by starting the container in interactive mode using:

```
docker run -it XYZ /bin/bash
```

Note that this requires a base Docker image that contains bash or some other interactive shell.



## main.js

Contains the source code of the actor in Node.js 7+.

## package.json

The file used by NPM to maintain meta-data about the package, such as list of dependencies.
See [NPM docs](https://docs.npmjs.com/files/package.json) for more details.

## Dockerfile

Contains instructions for Docker how to build the image for the actor.
For more information, see [Dockerfile reference](https://docs.docker.com/engine/reference/builder/).

## README.md

The readme file is used to generate a long description of the actor that is displayed in the
[Apify library](https://www.apify.com/apify/quick-start) as well as on the project's
[GitHub page](https://github.com/apifytech/actor-quick-start).

## apify_storage

When running the actor on the Apify cloud, the actor is automatically assigned
a key-value store that is used to store actor's input, output or any other data.
The `apify_storage/key_value_stores/default` directory is used to emulate this storage
during the local development of your actor.

The files in the directory represent the records in the key-value store - the name
of each file corresponds to its key and the content to the value.

For example, calling `Apify.getValue('INPUT')` will return the content
of the `apify_storage/key_value_stores/default/INPUT.json` file parsed as JSON. Similarly, calling
`Apify.setValue('OUTPUT', ...)` will write a file to `apify_storage/key_value_stores/default/OUTPUT.json`.

For more information, see the [Getting Started](https://sdk.apify.com/docs/guides/gettingstarted) tutorial
of the [Apify SDK](https://sdk.apify.com).
