CLASS zcl_04_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_abap_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA operand1 TYPE z04_decimal VALUE 5.

    DATA operand2 TYPE z04_decimal VALUE 3.

    DATA operator TYPE c LENGTH 1 VALUE '^'.

    DATA result TYPE p LENGTH 3 DECIMALS 2.


    IF operator = '+'.

      result = ( operand1 + operand2 ).



    ELSEIF operator = '-'.

      result = ( operand1 - operand2 ).



    ELSEIF operator = '*'.

      result = ( operand1 * operand2 ).


    ELSEIF operator = '/'.

      result = ( operand1 / operand2 ).


    ELSEIF operator = '¶'.

      result = zcl_04_calculator=>calculate_percentage( percentage = operand1  base = operand2 ).

    ELSEIF operator = '^'.

      TRY.
          result = zcl_abap_calculator=>calculate_power( exponent = CONV i( operand2 ) base = operand1 ).
        CATCH zcx_abap_exponent_too_high.
          "handle exception
          out->write( '|Exponent too high|' ).
      ENDTRY.

    ELSE.

      out->write( |Operator { operator } not defined| ).



    ENDIF.

    out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).








  ENDMETHOD.
ENDCLASS.
