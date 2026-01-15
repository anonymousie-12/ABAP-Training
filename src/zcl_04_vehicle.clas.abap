CLASS zcl_04_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    METHODS:

      constructor IMPORTING make TYPE string model TYPE string,
      set_speed_in_kmh IMPORTING speed_in_kmh TYPE i RAISING zcx_04_value_too_high,
      accelerate IMPORTING value TYPE i RAISING zcx_04_value_too_high,
      brake IMPORTING value TYPE i raising zcx_04_value_too_high.


    DATA make TYPE string READ-ONLY.

    DATA model TYPE string READ-ONLY.

    DATA speed_in_kmh TYPE i READ-ONLY.

    CLASS-DATA number_of_created_vehicles TYPE i READ-ONLY.



  PROTECTED SECTION.
  PRIVATE SECTION.



ENDCLASS.



CLASS zcl_04_vehicle IMPLEMENTATION.

  METHOD set_speed_in_kmh.

    if speed_in_kmh > 300.

        raise exception new zcx_04_value_too_high( value = speed_in_kmh ).

    endif.

    me->speed_in_kmh = speed_in_kmh.
  ENDMETHOD.

  METHOD accelerate.


    if value > speed_in_kmh.

        raise exception new zcx_04_value_too_high( value = value ).



    endif.

    speed_in_kmh += value.

  ENDMETHOD.

  METHOD brake.

    if value > speed_in_kmh.

        raise exception new zcx_04_value_too_high( value = value ).



    endif.



    speed_in_kmh -= value.

  ENDMETHOD.

  METHOD constructor.
    me->make = make.
    me->model = model.
    number_of_created_vehicles += 1.

  ENDMETHOD.

ENDCLASS.
