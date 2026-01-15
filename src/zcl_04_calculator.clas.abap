CLASS zcl_04_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS divide

      IMPORTING
                operand1      TYPE z04_decimal
                operand2      TYPE z04_decimal

      RETURNING VALUE(result) TYPE z04_decimal.


     CLASS-METHODS calculate_percentage
      IMPORTING
                percentage TYPE z04_DECIMAL
                base TYPE z04_DECIMAL

      RETURNING VALUE(percentage_value) TYPE z04_DECIMAL.





  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_calculator IMPLEMENTATION.

  METHOD divide.

    IF operand2 IS INITIAL.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.

    ENDIF.

    result = operand1 / operand2.

  ENDMETHOD.

  METHOD calculate_percentage.

    percentage_value = percentage * base / 100.

  ENDMETHOD.

ENDCLASS.

