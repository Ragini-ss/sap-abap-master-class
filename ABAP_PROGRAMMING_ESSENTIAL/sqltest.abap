REPORT Z_SQL_INJECTION_OPENSQL.
PARAMETERS: street  TYPE zemployees–street    LOWER CASE,
            zipcode TYPE zemployees–zipcode   LOWER CASE,
            city    TYPE zemployees–city      LOWER CASE,
            phone   TYPE zemployees–phone_ext.
DATA: set_expr TYPE string,
      user     TYPE xubname.
IF street IS NOT INITIAL.
  set_expr = set_expr && ` STREET    = ‘` && street && `’`.
ENDIF.
IF zipcode IS NOT INITIAL.
  set_expr = set_expr && ` ZIPCODE   = ‘` && zipcode && `’`.
ENDIF.
IF city IS NOT INITIAL.
  set_expr = set_expr && ` CITY      = ‘` && city && `’`.
ENDIF.
IF phone IS NOT INITIAL.
  set_expr = set_expr && ` PHONE_EXT = `  && phone.
ENDIF.
IF set_expr IS NOT INITIAL.
  user = cl_abap_syst=>get_user_name( ).
  UPDATE zemployees
     SET (set_expr)
   WHERE userid = user.
  IF sy–subrc = 0.
    MESSAGE ‘Your address was changed.’ TYPE ‘I’.
  ELSE.
    MESSAGE ‘Error when trying to update your address!’ TYPE ‘E’.
  ENDIF.ELSE.
  MESSAGE ‘No data given => No Update!’ TYPE ‘I’.
ENDIF.
