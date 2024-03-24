import io
import pandas as pd
import requests
from zipfile import ZipFile 
import os

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    """
    Template for loading data from API
    """
    URL_PREFIX = "https://cogo-sys-data.s3.amazonaws.com"
    for year in range(2018,2025):
        year = str(year).zfill(2)
        for month in range(1,13):
            month = str(month).zfill(2)
            URL = f"{URL_PREFIX}/{year}{month}-cogo-tripdata.zip"
            fname = URL.split('/')[-1]
            r = requests.get(URL)
            directory = f"data/raw/{year}/{month}/"
            if r.status_code == 200:
                os.makedirs(os.path.dirname(directory), exist_ok=True)
                print(f"Downloading {fname}")
                with open(f"{directory}/{fname}",'wb+') as file:
                    file.write(r.content)



@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'