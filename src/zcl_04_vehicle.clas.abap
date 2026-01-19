CLASS zcl_04_vehicle DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC .


  PUBLIC SECTION.


    METHODS:

      constructor IMPORTING make TYPE string model TYPE string,
      set_speed_in_kmh IMPORTING speed_in_kmh TYPE i RAISING zcx_04_value_too_high,
      accelerate FINAL IMPORTING value TYPE i RAISING zcx_04_value_too_high,
      brake FINAL IMPORTING value TYPE i RAISING zcx_04_value_too_high,
      to_String ABSTRACT RETURNING VALUE(string) TYPE string.


    DATA make TYPE string READ-ONLY.

    DATA model TYPE string READ-ONLY.

    DATA speed_in_kmh TYPE i READ-ONLY.

    CLASS-DATA number_of_created_vehicles TYPE i READ-ONLY.



  PROTECTED SECTION.
  PRIVATE SECTION.



ENDCLASS.



CLASS zcl_04_vehicle IMPLEMENTATION.

  METHOD set_speed_in_kmh.

    IF speed_in_kmh > 300.

      RAISE EXCEPTION NEW zcx_04_value_too_high( value = speed_in_kmh ).

    ENDIF.

    me->speed_in_kmh = speed_in_kmh.
  ENDMETHOD.

  METHOD accelerate.


    IF value > speed_in_kmh.

      RAISE EXCEPTION NEW zcx_04_value_too_high( value = value ).



    ENDIF.

    speed_in_kmh += value.

  ENDMETHOD.

  METHOD brake.

    IF value > speed_in_kmh.

      RAISE EXCEPTION NEW zcx_04_value_too_high( value = value ).



    ENDIF.



    speed_in_kmh -= value.

  ENDMETHOD.

  METHOD constructor.
    me->make = make.
    me->model = model.
    number_of_created_vehicles += 1.

  ENDMETHOD.



ENDCLASS.
