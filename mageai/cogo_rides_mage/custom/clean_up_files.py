if 'custom' not in globals():
    from mage_ai.data_preparation.decorators import custom
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test
import shutil
from os.path import isdir
@custom
def delete_files(*args, **kwargs):
    """
    args: The output from any upstream parent blocks (if applicable)

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    # Specify your custom logic here
    directory = 'data/'
    try:
        shutil.rmtree(directory)
    except OSError as e:
        print("Error: %s - %s." % (e.filename, e.strerror))
    return {directory}


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """

    assert not isdir(directory) , 'The output is undefined'
