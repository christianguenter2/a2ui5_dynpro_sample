CLASS zcl_a2ui_dynpro_app DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      z2ui5_if_app.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA client TYPE REF TO z2ui5_if_client.
    METHODS call_dynpro.
ENDCLASS.



CLASS zcl_a2ui_dynpro_app IMPLEMENTATION.

  METHOD z2ui5_if_app~main.

    me->client = client.

    IF client->check_on_init( ).
      client->view_display( z2ui5_cl_xml_view=>factory(
                                )->page(
                                )->button( text = 'Call dynpro'
                                           press = client->_event( 'press' )
                                )->stringify( ) ).
    ENDIF.

    CASE client->get( )-event.
      WHEN 'press'.
        call_dynpro( ).
    ENDCASE.

  ENDMETHOD.


  METHOD call_dynpro.

*  Test


    " of course this makes no sense in abap2UI5.
    " It's just to provoke "Sending of dynpro SAPLSPO1 0500 not possible" error.
    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        text_question  = 'Test'
      EXCEPTIONS
        text_not_found = 1
        OTHERS         = 2.

  ENDMETHOD.

ENDCLASS.
