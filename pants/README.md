# Using pants to build two lambdas

This contains the code and pants configuration required to build the `echo` and `plot` lambdas, with shared dependencies. Running this requires [the pants launcher](https://www.pantsbuild.org/docs/installation).

Results on an M1 macOS Macbook Pro:

| Lambda | Platform     | Works in AWS Lambda? | Build time (s) | Zip size (KB) |
|--------|--------------|----------------------|---------------:|--------------:|
| Echo   | Native macOS | yes                  |            2.0 |           193 |
| Plot   | Native macOS | yes                  |            7.7 |        40 109 |

This uses a development pre-release of pants (2.18.0.dev7), because that contains some significant quality-of-life improvements that makes for simpler slides/explanation. The core functionality is the same as the 2.17.0 version of pants (which is slightly improved from 2.16.0). To adopt Pants for building lambdas, start at ["Getting started"](https://www.pantsbuild.org/docs/getting-started) and then follow ["AWS Lambda"](https://www.pantsbuild.org/docs/awslambda-python) or ["Google Cloud Functions"](https://www.pantsbuild.org/docs/google-cloud-function-python).
