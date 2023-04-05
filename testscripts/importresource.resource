*** Settings ***
Library    Browser
Library    RequestsLibrary
Library    JSONLibrary
Library    re
Library    BuiltIn
Library     OperatingSystem
Library     Collections
Library     String
Library     ../scripts/csv_generator.py
Library     ../scripts/utilities.py
Library     ../scripts/tax_relief_calculation.py
Resource    ../Config/TestProperties.robot