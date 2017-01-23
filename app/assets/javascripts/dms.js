(function($,sr){
  // debouncing function from John Hann
  // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
  var debounce = function (func, threshold, execAsap) {
    var timeout;
      return function debounced () {
        var obj = this, args = arguments;
        function delayed () {
          if (!execAsap)
            func.apply(obj, args);
          timeout = null;
        }

        if (timeout)
          clearTimeout(timeout);
        else if (execAsap)
          func.apply(obj, args);
        timeout = setTimeout(delayed, threshold || 100);
      };
  };
    // smartresize
  jQuery.fn[sr] = function(fn){
      return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr);};
})(jQuery,'smartresize');

// Sidebar
$(document).on('turbolinks:load', function() {
  var CURRENT_URL = window.location.href.split('#')[0].split('?')[0],
  $BODY = $('body'),
  $MENU_TOGGLE = $('#menu_toggle'),
  $SIDEBAR_MENU = $('#sidebar-menu'),
  $SIDEBAR_FOOTER = $('.sidebar-footer'),
  $LEFT_COL = $('.left_col'),
  $RIGHT_COL = $('.right_col'),
  $NAV_MENU = $('.nav_menu'),
  $FOOTER = $('footer');
  // TODO: This is some kind of easy fix, maybe we can improve this
  var setContentHeight = function () {
    // reset height
    $RIGHT_COL.css('min-height', $(window).height());

    var bodyHeight = $BODY.outerHeight(),
      footerHeight = $BODY.hasClass('footer_fixed') ? -10 : $FOOTER.height(),
      leftColHeight = $LEFT_COL.eq(1).height() + $SIDEBAR_FOOTER.height(),
      contentHeight = bodyHeight < leftColHeight ? leftColHeight : bodyHeight;
    // normalize content
    contentHeight -= $NAV_MENU.height() + footerHeight;
    $RIGHT_COL.css('min-height', contentHeight);
  };

  $SIDEBAR_MENU.find('a').on('click', function(ev) {
    var $li = $(this).parent();

    if ($li.is('.active')) {
      $li.removeClass('active active-sm');
      $('ul:first', $li).slideUp(function() {
        setContentHeight();
      });
    } else {
      // prevent closing menu if we are on child menu
      if (!$li.parent().is('.child_menu')) {
        $SIDEBAR_MENU.find('li').removeClass('active active-sm');
        $SIDEBAR_MENU.find('li ul').slideUp();
      }
      $li.addClass('active');
      $('ul:first', $li).slideDown(function() {
        setContentHeight();
      });
    }
  });

  // toggle small or large menu
  $MENU_TOGGLE.on('click', function() {
    if ($BODY.hasClass('nav-md')) {
      $SIDEBAR_MENU.find('li.active ul').hide();
      $SIDEBAR_MENU.find('li.active').addClass('active-sm')
        .removeClass('active');
    } else {
      $SIDEBAR_MENU.find('li.active-sm ul').show();
      $SIDEBAR_MENU.find('li.active-sm').addClass('active')
        .removeClass('active-sm');
    }

    $BODY.toggleClass('nav-md nav-sm');

    setContentHeight();
  });

    // check active menu
  $SIDEBAR_MENU.find('a[href="' + CURRENT_URL + '"]').parent('li')
    .addClass('current-page');

  $SIDEBAR_MENU.find('a').filter(function () {
    return this.href == CURRENT_URL;
  }).parent('li').addClass('current-page').parents('ul').slideDown(function() {
      setContentHeight();
  }).parent().addClass('active');

  // recompute content when resizing
  $(window).smartresize(function(){
    setContentHeight();
  });

  setContentHeight();

  // fixed sidebar
  if ($.fn.mCustomScrollbar) {
    $('.menu_fixed').mCustomScrollbar({
      autoHideScrollbar: true,
      theme: 'minimal',
      mouseWheel:{ preventDefault: true }
    });
  }
});

$(document).on('turbolinks:load', function() {
  set_up_chosen();
  $('#show_form_login').on('click',function(){
    if($('#form_login').css('display') === 'block'){
      $('#form_login').slideUp();
    }
    else{
      $('#form_login').slideDown();
    }
  });
})

function changeSearchForm(){
    $('#form-submit').submit();
}

function groupChange(url, source_dropdow_id, target_dropdow_id) {
  var source_id = $('#'+source_dropdow_id).val()
  $.ajax({
    url: url + '?id=' + source_id,
    type: 'get',
    dataType: 'json',
    success: function(data) {
      var options = $('#' + target_dropdow_id);
      $(options).html('')
      $.each(data, function () {
        options.append($('<option />').val(this.id).text(this.name));
      });
      options.trigger('chosen:updated');
      options.change()
    },
    error: function (xhr, ajaxOptions, thrownError) {
       alert(thrownError);
    }
  });
}

function set_up_chosen(){
  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '100%'
  });
}

function assignmentDropChange(url,source, class_target){
  var idDropSource = $(source).attr('id')
  var idTarget = $(source).closest('tr').find('.'+ class_target).attr('id')
  if (idDropSource != undefined && idTarget!= undefined) {
     groupChange(url,idDropSource,idTarget);
  }
}

function removeAssignmentDevice(button){
  $(button).closest('tr').remove();
  resetIndex();
}

function resetIndex(){
  $('#tbl-assignment-detail tbody tr').each(function(index) {
      var groupCategoryDropdown = $(this).find('.device-group')
      var deviceCategoryDropdown = $(this).find('.device-caterory')
      var devideDropdown = $(this).find('.device')

      $(groupCategoryDropdown).attr('id','group_id_' + index)
      $(deviceCategoryDropdown).attr('id','device_category_id_' + index)
      $(devideDropdown).attr('id','device_id_' + index)

      $(devideDropdown).attr('name','assignment[assignment_details_attributes][' + index + '][device_id]')
  });
}

function submitForm(){
  var isValid = true
  $('.device').each(function(index) {
    var deviceId = $(this).val()
    if (deviceId == null || deviceId == undefined) {
      isValid = false;
    }
  });

 if (isValid) {
    $('#new_assignment').submit();
  }
  else {
    $('#error').html('')
    $('#error').append('<div id="error_explanation">' +
      '<div class="alert alert-danger">Errors: 1 </div>' +
      '<ul><li>' + I18n.t("assignment.message.device_duplicate") + '</li></ul>' +
      '</div>')
  }
};

function getDeviceCode(url) {
  var device_category_id =  $('.device-category').val()
  $.ajax({
    url: url + '?device_category_id=' + device_category_id,
    type:'get',
    dataType: 'json',
    success: function(data) {
      debugger;
      $('.device-code').val(data.device_code)
    }
  });
}
