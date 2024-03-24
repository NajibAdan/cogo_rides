import os
import pandas as pd
if 'custom' not in globals():
    from mage_ai.data_preparation.decorators import custom
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@custom
def transform_custom(*args, **kwargs):
    """
    args: The output from any upstream parent blocks (if applicable)

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    PATH_PREFIX = "data/raw"
    cols = {
        "ride_id"            : str,
        "rideable_type"       : str,
        "started_at"          : str,
        "ended_at"            : str,
        "start_station_name"  : str,
        "start_station_id"    : str,
        "end_station_name"    : str,
        "end_station_id"      : str,
        "start_lat"           : str,
        "start_lng"           : str,
        "end_lat"             : str,
        "end_lng"             : str,
        "member_casual"       : str,
        "tripduration"        : str
    }
    
    rides = []
    for year in os.listdir(PATH_PREFIX):
        for month in os.listdir(f"{PATH_PREFIX}/{year}"):
            file = os.listdir(f"{PATH_PREFIX}/{year}/{month}")[0]
            file = f"{PATH_PREFIX}/{year}/{month}/{file}"
            rides.append(pd.read_csv(file, dtype = cols))

    
    return pd.concat(rides)


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
