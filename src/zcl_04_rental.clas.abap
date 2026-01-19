CLASS zcl_04_rental DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  interfaces zif_04_partner.

    TYPES ty_vehicles type TABLE of REF to zcl_04_vehicle.

    DATA vehicles TYPE ty_vehicles READ-only.

    METHODS add_vehicle IMPORTING vehicle type ref to zcl_04_vehicle.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_rental IMPLEMENTATION.
  METHOD add_vehicle.
  APPEND vehicle to vehicles.
  ENDMETHOD.

  METHOD zif_04_partner~to_string.
   string = 'Ich bin die Autovermietung'.

  ENDMETHOD.

ENDCLASS.
