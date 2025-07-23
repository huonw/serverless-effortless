python_requirements(name="reqs")
python_sources(name="sources")

python_aws_lambda_function(
    name="echo",
    handler="./echo.py:handler",
    # include_requirements=False,
)
python_aws_lambda_function(
    name="plot",
    handler="./plot.py:handler",
    include_requirements=False,
)

python_aws_lambda_layer(
    name="echo-deps",
    dependencies=["echo.py:sources"],
    include_sources=False,
)
python_aws_lambda_layer(
    name="plot-deps",
    dependencies=["plot.py:sources"],
    include_sources=False,
)
