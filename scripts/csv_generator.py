import csv

valid_header =['natid','name','gender','salary','birthday','tax']
valid_data=[['123456','Yogesh','M','5000','05021992','50'],['654321','Anita','F','4000','12111993','20']]
invalid_header =['natid','name','gender','salary','birthday','tax']
invalid_data=[['test','Yogesh','invalid_gender','testsal','5feb1992','testtax'],['654321','Anita','F','4000','12111993','20']]
path_for_valid_csv_data  = "../testData/upload_csv_file/valid_document.CSV"
path_for_invalid_csv_data  = "../testData/upload_csv_file/invalid_document.CSV"

def create_valid_csv_test_data(path):
    """
        Function description :
            Generating valid CSV test data.

        Parameters
        ----------
        path : str
            path for csv file location

        Returns
        -------
        NA
    """
    with open(path, 'w', encoding='UTF8', newline='') as f:
        writer = csv.writer(f)
        # write the header
        writer.writerow(valid_header)
        # write multiple rows
        writer.writerows(valid_data)

def create_invalid_csv_test_data(path):
    """
        Function description :
            Generating invalid CSV test data.

        Parameters
        ----------
        path : str
            path for csv file location

        Returns
        -------
        NA
    """
    with open(path, 'w', encoding='UTF8', newline='') as f:
        writer = csv.writer(f)
        # write the header
        writer.writerow(invalid_header)
        # write multiple rows
        writer.writerows(invalid_data)