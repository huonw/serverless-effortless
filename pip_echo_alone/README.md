# Using pip & docker to build one lambda

This contains the code and "build system" scripts to build the single `echo` lambda. The `run.sh` script runs three experiments.

Results on an M1 macOS Macbook Pro:

| Lambda | Platform      | Works in AWS Lambda? | Build time (s) | Zip size (KB) |
|--------|---------------|----------------------|---------------:|--------------:|
| Echo   | Native macOS  | no                   |            0.5 |           213 |
| Echo   | ARM Docker    | no                   |            1.4 |           229 |
| Echo   | x86-64 Docker | yes                  |            5.1 |           230 |
