import re

def is_masked(masked_str):
    """
        Function description :
            check is masked with doller sign

        Parameters
        ----------
        masked_str : str
            check for masked string

        Returns
        -------
        status: str
            status of is masked
    """
    pattern = r'^.{4}\$.*$'
    return re.match(pattern, masked_str) is not None

def validate_number(num):
    """
        Function description :
            validate number

        Parameters
        ----------
        num : int
            number to validate

        Returns
        -------
        status: str
            status of validation
    """
    if num.isdigit():
       return True
    elif num.replace('.','',1).isdigit() and num.count('.') < 2:
       return True
    else:
       return False

def validate_date(date):
    """
        Function description :
            validate date format

        Parameters
        ----------
        date : int
            date format

        Returns
        -------
        status: str
            status of validation
    """
    try:
        date.isdigit()
        assert len(date) == 8
        assert int(date[0:2]) <= 31
        assert int(date[2:4]) <= 12
        assert int(date[4:8]) >= 1800 or int(date[4:8]) <= 2022
        return True
    except:
        return False

def check_file_data(path):
    """
        Function description :
            check file data

        Parameters
        ----------
        path : str
            file path to be check

        Returns
        -------
        status: str
            status of validation
    """
    try:
        f= open(path)
        counter = 0
        for i in f:
            if counter!=0:
                lst=i.split(",")
                assert lst[0].isnumeric()
                assert lst[1].isalpha()
                assert lst[2].lower()=="m" or lst[2].lower()=="f"
                assert validate_number(lst[3])==True
                assert validate_date(lst[4])==True
            counter=counter+1
        return True
    except:
        return False

def get_color_name_by_rgb(rgb):
    """
        Function description :
            get color name by rgb

        Parameters
        ----------
        rgb : str
            rgb values of element

        Returns
        -------
        color: str
            color of element
    """
    if rgb=="rgb(220, 53, 69)":
        return "Red"
    else:
        return "Color yet to define"