$(function () {
  if (!$('.admin').length && !$('#photos').length) { return; }

  var data = {
    'photo[event_id]': $('#upload-photo').data("event-id")
  };

  data[$('meta[name="csrf-param"]').attr('content')] = $('meta[name="csrf-token"]').attr('content');

  var uploader = new plupload.Uploader({
    url: '/photos',
    method: 'POST',
    browse_button: 'upload-photo',
    drop_element: 'events',
    filters: {
      mime_types: [{
        extensions: 'jpeg,jpg,JPEG,JPG,png'
      }],
      prevent_duplicates: true
    },

    multi_selection: true,

    runtimes: 'html5',
    container: 'action-bar',
    unique_names: true,
    multipart: true,
    multipart_params: data,
    file_data_name: 'photo[attachment]'
  });

  uploader.bind('FilesAdded', function (uploader, files) {
    uploader.start();
  });

  uploader.bind('FileUploaded', function (uploader, file, response) {
    var photo = $.parseJSON(response.response).photo;
    $('#photos .row').append('<div class="photo"><a href="#" tabindex="0" class="delete" data-id="' + photo.id + '">' +  icon("cancel-solid", { title: 'Delete Photo' }) + '</a><img src="' + photo.src + '"/></div>');
  });

  $('#photos').on('click', '.photo .delete', function (evt) {
    var $photo = $(this).parent();
    var csrf = {};
    csrf[$('meta[name="csrf-param"]').attr('content')] = $('meta[name="csrf-token"]').attr('content');
    $.ajax({
      url: '/photos/' + $(this).data('id'),
      type: 'DELETE',
      data: csrf,
      success: function () {
        $photo.remove();
      }
    });
    evt.preventDefault();
  });

  uploader.init();
});
