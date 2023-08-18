pip install  -r requirements.txt -t package
cp echo.py package/
cd package
zip --quiet -r echo.zip .
