Flex SDK Docker Image
=====================

[![GitHub release](https://img.shields.io/github/release/instrumentisto/flex-sdk-docker-image.svg)](https://hub.docker.com/r/instrumentisto/flex-sdk/tags)
[![Build Status](https://travis-ci.org/instrumentisto/flex-sdk-docker-image.svg?branch=master)](https://travis-ci.org/instrumentisto/flex-sdk-docker-image)
[![Docker Pulls](https://img.shields.io/docker/pulls/instrumentisto/flex-sdk.svg)](https://hub.docker.com/r/instrumentisto/flex-sdk)




## What is Flex SDK?

Flex is a powerful, open source application framework that allows you to easily build mobile applications for iOS, Android™, and BlackBerry® Tablet OS devices, as well as traditional applications for browser and desktop using the same programming model, tool, and codebase. You can use the Flex SDK to create a wide range of highly interactive, expressive applications. For example, a data visualization application built in Flex can pull data from multiple back-end sources and display it visually.

> [flex.apache.org](https://flex.apache.org)

![Flex Logo](https://flex.apache.org/images/logo_01_fullcolor-sm.png)




## How to use this image

Mount your project into `/app` directory and provide the command you require:

```bash
docker run --rm -it -v $(pwd):/app instrumentisto/flex-sdk mxmlc app.mxml
```

The image also contains [Ant][3] and [Gradle][1] build tools. So, if you are using [GradleFx][2] in project, just specify desired Gradle command:

```bash
docker run --rm -it -v $(pwd):/app instrumentisto/flex-sdk gradle buildFx
```

The image contains [standalone version of Flash Player Debugger][4] and [Xvfb][5] for running it. If you need it (for running [FlexUnit][6] tests, for example), just prepend your command with `xvfb` wrapper:

```bash
docker run --rm -it -v $(pwd):/app instrumentisto/flex-sdk xvfb gradle test
```

Note, that `xvfb` is just a simple wrapper script for `xvfb-run` command. This is not the same as `Xvfb` binary present in the image.




## Environment Variables


### `RESOLUTION`

This variable allows you to specify desired resolution for Xvfb screen.
 
```bash
docker run --rm -it -v $(pwd):/app -e RESOLUTION='800x600x24' \
    instrumentisto/flex-sdk xvfb gradle test
```

The default value is `1024x768x24`.




## Image versions


### `latest`

Latest version of Flex SDK with latest Flash Player version.


### `X`

Latest version of Flex SDK major version `X` branch with latest Flash Player version.


### `X.Y`

Latest version of Flex SDK `X.Y` branch with latest Flash Player version.


### `X.Y.Z`

Concrete `X.Y.Z` version of Flex SDK with latest Flash Player version.


### `X.Y.Z-fpA`

Concrete `X.Y.Z` version of Flex SDK with latest Flash Player `A` major version.


### `X.Y.Z-fpA.B.C.D`

Concrete `X.Y.Z` version of Flex SDK with concrete Flash Player `A.B.C.D` version.




## License

Flex SDK itself is licensed under [Apache-2.0 license][91].

Flash Player Debugger is licensed under [Adobe Flash Player Usage Rights][92].

Flex SDK Docker image is licensed under [MIT license][90].




## Issues

We can't notice comments in the DockerHub, so don't use them for reporting issue or asking question.

If you have any problems with or questions about this image, please contact us through a [GitHub issue][100].





[1]: https://gradle.org
[2]: http://gradlefx.org
[3]: http://ant.apache.org
[4]: https://www.adobe.com/support/flashplayer/debug_downloads.html
[5]: https://en.wikipedia.org/wiki/Xvfb
[6]: https://cwiki.apache.org/confluence/display/FLEX/FlexUnit
[90]: https://github.com/instrumentisto/flex-sdk-docker-image/blob/master/LICENSE.md
[91]: http://flex.apache.org/about-licensing.html
[92]: http://www.adobe.com/products/eula/tools/flashplayer_usage.html
[100]: https://github.com/instrumentisto/flex-sdk-docker-image/issues
