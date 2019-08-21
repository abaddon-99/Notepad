<form class='form-horizontal' action='$SELF_URL' name='notepad_form' method='POST'>
  <input type=hidden name='index' value='$index'>
  <input type='hidden' name='%SUBMIT_BTN_ACTION%' value='1' />
  <input type=hidden name='ID' value='$FORM{chg}'>

  <div class='box box-theme box-form'>
    <div class='box-header with-border'><h4 class='box-title'>_{NOTE}_</h4></div>

    <div class='box-body'>

      <div class='form-group' data-visible='%CAN_SELECT_AID%' style='display: none'>
        <label class='control-label col-md-3' for='AID'>_{ADMIN}_:</label>
        <div class='col-md-9'>
          %AID_SELECT%
        </div>
        <hr>
      </div>

      <div class='form-group'>
        <label class='control-label col-md-3' for='SHOW_AT'>_{DATE}_:</label>
        <div class='col-md-9'>
          %DATETIMEPICKER%
        </div>
      </div>

      <hr/>

      %PERIODIC%


      <div class='form-group'>
        <label class='control-label col-md-2'>_{STATUS}_:</label>
        <div class='col-md-10'>
          %STATUS_SELECT%
        </div>
      </div>

      <div class='form-group'>
        <label class='control-label col-md-2' for='SUBJECT'>_{SUBJECT}_:</label>
        <div class='col-md-10'>
          <input class='form-control' type='text' name='SUBJECT' id='SUBJECT' required='required' value='%SUBJECT%'/>
        </div>
      </div>

      <div class='form-group'>
        <label class='control-label col-md-2' for='TEXT'>_{TEXT}_:</label>
        <div class='col-md-10'>
          <textarea name='TEXT' id='TEXT' rows='4' class='form-control'>%TEXT%</textarea>
        </div>
      </div>

      <div class="form-group" data-visible='%ID%'>
        <label class='control-label col-md-2'>_{LIST}_:</label>
        <div class="col-md-10">
          %CHECKLIST%
        </div>
      </div>

    </div>
    <div class='box-footer'>
      <input class='btn btn-primary' type='submit' name='%ACTION%' value='%SUBMIT_BTN_NAME%'/>
    </div>
  </div>

</form>

