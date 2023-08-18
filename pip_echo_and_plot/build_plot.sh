pip install --quiet -r requirements.txt -t package
cp plot.py package/
cd package
zip --quiet -r plot.zip .
