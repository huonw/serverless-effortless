echo "Building natively"
# ensure we're running with a clean pip
venv=$(mktemp -d)
python3.10 -m venv $venv
. $venv/bin/activate
pip install --upgrade pip

rm -rf package
time bash build_echo.sh
cp package/echo.zip echo-native.zip

deactivate
rm -rf $venv

echo "Building docker"
rm -rf package
docker pull public.ecr.aws/sam/build-python3.10
time docker run -v $PWD:/code -w /code public.ecr.aws/sam/build-python3.10 bash build_echo.sh
cp package/echo.zip echo-docker-arm.zip

echo "Building emulated docker"
rm -rf package
docker pull --platform linux/amd64 public.ecr.aws/sam/build-python3.10
time docker run -v $PWD:/code -w /code  --platform linux/amd64 public.ecr.aws/sam/build-python3.10 bash build_echo.sh
cp package/echo.zip echo-docker-x86-64.zip

wc -c *.zip
