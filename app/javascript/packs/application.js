// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
//= require_tree .

$(document).ready(function() {
  var $fileInput = $(".file_input")
  var $droparea = $('.file_droparea')

  $fileInput.on('dragenter focus click', function () {
    $droparea.addClass('is-active')
  })

  $fileInput.on('dragleave blur drop', function () {
    $droparea.removeClass('is-active')
  })

  $fileInput.on('change', function () {
    var filesCount = $(this)[0].files.length
    var $textContainer = $('.js-set-number')
    if (filesCount === 1) {
      $textContainer.text($(this).val().split('\\').pop())
    } else {
      $textContainer.text(filesCount + ' uploaded files')
    }
  });
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
