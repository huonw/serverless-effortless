for lambda in echo plot; do
    echo "Building $lambda natively"
    # ensure we're running with a clean pip
    venv=$(mktemp -d)
    python3.10 -m venv $venv
    . $venv/bin/activate
    pip install --upgrade pip

    rm -rf package
    time bash build_$lambda.sh
    cp package/$lambda.zip $lambda-native.zip

    deactivate
    rm -rf $venv

    echo "Building $lambda docker"
    rm -rf package
    docker pull public.ecr.aws/sam/build-python3.10
    time docker run -v $PWD:/code -w /code public.ecr.aws/sam/build-python3.10 bash build_$lambda.sh
    cp package/$lambda.zip $lambda-docker-arm.zip

    echo "Building $lambda emulated docker"
    rm -rf package
    docker pull --platform linux/amd64 public.ecr.aws/sam/build-python3.10
    time docker run -v $PWD:/code -w /code  --platform linux/amd64 public.ecr.aws/sam/build-python3.10 bash build_$lambda.sh
    cp package/$lambda.zip $lambda-docker-x86-64.zip
done

wc -c *.zip
