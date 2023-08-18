# Using pip & docker to build two lambdas

This contains the code and "build system" scripts to build the `echo` and `plot` lambdas, with shared dependencies. The `run.sh` script runs six experiments.

Results on an M1 macOS Macbook Pro:

| Lambda | Platform      | Works in AWS Lambda? | Build time (s) | Zip size (KB) |
|--------|---------------|----------------------|---------------:|--------------:|
| Echo   | Native macOS  | no                   |            6.7 |        35 578 |
| Echo   | ARM Docker    | no                   |             58 |        42 858 |
| Echo   | x86-64 Docker | yes                  |            109 |        47 632 |
| Plot   | Native macOS  | no                   |            7.4 |        35 577 |
| Plot   | ARM Docker    | no                   |             57 |        42 856 |
| Plot   | x86-64 Docker | yes                  |            102 |        47 635 |
