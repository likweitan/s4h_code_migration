CLASS zcl_material_information_lw1 DEFINITION
PUBLIC
FINAL
CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        matnr               TYPE I_Product-Product
      RETURNING
        VALUE(material_art) TYPE I_Product-ProductType.
ENDCLASS.

CLASS zcl_material_information_lw1 IMPLEMENTATION.
  METHOD get_material_art.
    DATA material TYPE i_product.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE abap_boolean.
    production_date = sy-datum.
    SELECT SINGLE       FROM i_product FIELDS producttype
                        WHERE product = @matnr INTO CORRESPONDING
    FIELDS OF @material.
    material_art = material-producttype.
  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_information_lw1.

    material_info = NEW zcl_material_information_lw1( ).

    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.
