def taxReliefCalculation(gender,salary,age,tax_paid):
    """
        Function description :
            Calculation for Tax Relief.

        Parameters
        ----------
        gender : str
            Gender of person i.e M or F
        salary : int
            Salary of person
        age : int
            Age of the person
        tax_paid : int
            Tax paid by person

        Returns
        -------
        tax_relif: int
            counted tax relief
    """
    variable = get_variable_by_age(age)
    bonus = get_bonus_by_gender(str(gender))
    tax_relif=((float(salary)-float(tax_paid))*float(variable))+float(bonus)
    if tax_relif>0.00 and tax_relif<50.00:
        return float(50.00)
    else:
        return tax_relif

def get_variable_by_age(age):
    """
        Function description :
            Calculation variable by age

        Parameters
        ----------
        age : int
            Age of the person

        Returns
        -------
        variable: int
            variable by age
    """
    if float(age)>0 and float(age)<=18:
        return int(1)
    if float(age)<=35:
        return float(0.8)
    if float(age)<=50:
        return float(0.5)
    if float(age)<=75:
        return float(0.367)
    if float(age)>=76:
        return float(0.05)

def get_bonus_by_gender(gender):
    """
        Function description :
            Calculation bonus by gender

        Parameters
        ----------
        gender : str
            gender of the person

        Returns
        -------
        bonus: int
            bonus by age
    """
    if gender=="M":
        return float(0)
    if gender=="F":
        return float(500)

def truncate_and_round(number):
    """
        Function description :
            Truncate and round

        Parameters
        ----------
        number : int
            number to be truncate and round

        Returns
        -------
        rounded_number: int
            rounded number
    """
    # Convert number to a float with two decimal places
    number = float(f'{number:.2f}')
    # Round the number using the normal rounding rule
    rounded_number = round(number)
    return rounded_number