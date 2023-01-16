REPORT Z_UPLOAD_NO_CHECK.
PARAMETERS: pv_fname TYPE c LENGTH 64 LOWER CASE DEFAULT ‘test.txt’,
            pv_text  type string LOWER CASE DEFAULT ‘This is the file contents’.
DATA        lv_full_name TYPE string.

AT SELECTION-SCREEN.
  if pv_fname = ”.
    MESSAGE ‘You need to specify a file name.’ TYPE ‘E’.
  ENDIF.
  lv_full_name = ‘/tmp/’ && pv_fname. “Assume enduser inputs only a relative file name.

START-OF-SELECTION.
  OPEN DATASET lv_full_name FOR OUTPUT IN TEXT MODE ENCODING UTF–8 .
  IF SY–SUBRC <> 0.
      MESSAGE ‘Could not open file’&& lv_full_name TYPE ‘E’.
  ELSE.
      TRANSFER pv_text TO lv_full_name.
      CLOSE DATASET lv_full_name.
      Write :/ ‘contents was saved to:’, lv_full_name.
  ENDIF.
