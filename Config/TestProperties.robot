*** Variables ***
${BROWSER}            chromium
${HEADLESS_MODE}      false
${DEFAULT_TIMEOUT}    30 seconds
${base_url}     http://localhost:8080
${Upload_Button}    //input[@type='file']
${upoaded_csv_file_data_div}    //*[@class='m-4']
${dispense_now_button}      //a[@href="dispense"]
${dispense_now_page_text}      //div[contains(@class,'display-4 font-weight-bold')]
${valid_headers}    natid,name,gender,salary,birthday,tax
#Path for files
${valid_csv_file_path}  ${EXECDIR}${/}testData${/}upload_csv_file${/}valid_document.csv
${invalid_csv_file_path}  ${EXECDIR}${/}testData${/}upload_csv_file${/}invalid_document.csv