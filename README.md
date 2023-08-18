# Packaging for serverless - effortless? Doubtless

[Presented at PyCon AU 23](https://2023.pycon.org.au/program/RAKQDU/), related to [Open Source at ExoFlare](https://www.exoflare.com/open-source/?utm_source=pyconau23&utm_campaign=open_source).

A package-and-deploy pipeline is like plumbing: if it's working, you don't notice, but when it's not… you really do, and getting it working can be messy. We've tried several approaches for building Python artefacts to run on AWS Lambda, and finally settled on one that works well. I'll walk through how the Pants build system works in practice for getting our code running in production, and how it's improved upon other common practices we previously used.

Across our system, we have dozens of serverless functions, most of which use PyPI dependencies. We previously used techniques like running `pip install --target=...` in a docker image, then copying in our source code: it mostly works, but… it sparks thumb-twiddling and pipeline-clogging more than it sparks joy.

Using [Pants](https://www.pantsbuild.org), we build our artefacts quickly, reliably, cross-platform, and without boilerplate! Our builds are quick, through caching, parallelism, and avoiding emulation. Dependency inference means each only includes exactly what it needs, without maintaining careful lists. We even benefit from these more generally, like testing and building non-serverless artefacts too.

Faster coding, faster builds, faster deploys, and faster cold-starts. It's like a working drain: Who doesn’t want that?

## Examples

This repository stores the code examples used in the talk:

1. [`pip_echo_alone/`](pip_echo_alone/): the first example, using pip & docker to build the Echo lambda in isolation, and its single `msgspec` requirement.
2. [`pip_echo_and_plot/`](pip_echo_and_plot/): the second example, using pip & docker to build both Echo and Plot lambdas, along with the three requirements: `msgspec`, `pandas` and `matplotlib`. This demonstrates the impact of the additional dependencies on the Echo lambda.
3. [`pants/`](pants/): the final example, using Pants to build both lambdas and have fast builds and low configuration

Detailed results, to build a working zip file:

| Lambda           | Build system | Time (s) | Zip size (KB) |
|------------------|--------------|---------:|--------------:|
| Echo             | pip & docker |      5.1 |           228 |
| Echo (with Plot) | pip & docker |      109 |        47 632 |
| Echo             | pants        |      2.0 |           198 |
| Plot             | pip & docker |      102 |        47 635 |
| Plot             | pants        |      7.7 |        40 109 |

When cached, Pants will emit the artifact near-instantly, without needing a build step.

## Related links

- [Open Source at ExoFlare](https://www.exoflare.com/open-source/?utm_source=pyconau23&utm_campaign=open_source)
- [Pants build system](https://www.pantsbuild.org)
- [Building AWS Lambdas with Pants](https://www.pantsbuild.org/docs/awslambda-python)
- [Building Google Cloud Functions with Pants](https://www.pantsbuild.org/docs/google-cloud-function-python)
- [How would a corgi wear pants?](https://www.dinotomic.com/product/275-corgi-pants-print)
