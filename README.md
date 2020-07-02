This is a simple Apify actor that serves as a basic boilerplate.
It has a Node.js source code, custom Dockerfile and it's hosted in a Git repository.
Feel free to copy this actor, modify it and use it in your own actors.

Are you missing anything? Something not clear? Please let us know at support@apify.com

To run the actor in your local environment, simply run the following commands:

```bash
npm install
npm run start
```

Alternatively, if you have [Apify CLI](https://apify.com/docs/cli) installed, you can start the actor by running:

```bash
apify run
```

In order to test the build of the Docker image, you can run:

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


## `.gitignore`

Specifies files and directories that shouldn't be included in the Git repository.

## `apify.json`

The file is used by [Apify CLI](https://apify.com/docs/cli)
and it contains information linking your local source code directory with the
actor on the Apify platform.
You only need this file if you want to run commands such as `apify run`
or `apify push`.

## `Dockerfile`

Contains instructions how to build a Docker image that will contain
all the code and configuration needed to run your actor.
For more information, see [Dockerfile reference](https://docs.docker.com/engine/reference/builder/).

## `INPUT_SCHEMA.json`

Defines schema for the actor input. It is used by the Apify platform
to automatically check the input for the actor and to generate
a user interface to help users of your actor to run it.
For more information, see [Input Schema documentation](https://apify.com/docs/actor/input-schema). 

## `main.js`

The main Node.js source code of your actor.
It is referenced from the `scripts` section of the `package.json` file,
so that it can be started by running `npm start`.

## `package.json`

The file is used by NPM to maintain metadata about the Node.js source code,
such as the list of dependencies.
For details, see [NPM documentation](https://docs.npmjs.com/files/package.json).

## `README.md`

Contains a [Markdown](https://www.markdownguide.org/cheat-sheet)
documentation what your actor does and how to use it,
which is then displayed in the app or [library](https://apify.com/apify/quick-start).
It's always a good idea to write a good README.md, in a few months not even you
will remember all the details about the actor.

## `apify_storage`

This directory contains data from
[Apify SDK storages](https://sdk.apify.com/docs/guides/data-storage)
during local development, such as the key-value stores,
datasets and request queues.
Typically you don't want to have the `apify_storage` directory in Git repo,
but in this boilerplate we keep the `INPUT.json` file in Git
for documentation purposes.

When running the actor on the Apify platform, the actor is automatically assigned
a key-value store that is used to store actor's input, output or any other data.
The `apify_storage/key_value_stores/default` directory is used to emulate this store
during the local development of your actor.
The files in the directory represent the records in the key-value store: the name
of each file corresponds to its key and the content to the value.

For example, calling `Apify.getValue('INPUT')` will return the content
of the `apify_storage/key_value_stores/default/INPUT.json` file parsed as JSON. Similarly, calling
`Apify.setValue('OUTPUT', ...)` will write a file to `apify_storage/key_value_stores/default/OUTPUT.json`.

For more information, see the [Getting Started](https://sdk.apify.com/docs/guides/getting-started) tutorial
of the [Apify SDK](https://sdk.apify.com).
