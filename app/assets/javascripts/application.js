// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require summernote/summernote-bs4.min
//= require summernote/lang/summernote-ja-JP
//= require activestorage
//= require chartkick
//= require Chart.bundle
//= require turbolinks
//= require_tree


$(function () {
  $(".edit-answer-button").on("click", function () {
    var answerId = $(this).data("answer-id");
    var answerLabelArea = $("#answer-content-" + answerId);
    var answerTextArea = $("#edit-answer-" + answerId);
    var answerButton = $("#answer-button-" + answerId);

    answerLabelArea.hide();
    answerTextArea.show();
    answerButton.show();
  });
});


$(function () {
  $(".answer-cancel-button").on("click", function () {
    var answerId = $(this).data("cancel-id");
    var answerLabelArea = $("#answer-content-" + answerId);
    var answerTextArea = $("#edit-answer-" + answerId);
    var answerButton = $("#answer-button-" + answerId);

    answerLabelArea.show();
    answerTextArea.hide();
    answerButton.hide();
  });
});

$(function () {
  $(".answer-update-button").on("click", function () {
    var answerId = $(this).data("update-id");
    var answerTextArea = $("#edit-answer-"  + answerId);
    var body = answerTextArea.val();

    $.ajax({
      url: "/answers/" + answerId,
      type: "PATCH",
      data: {
        answer: {
          content: body
        }
      }
    })
    .done(function () {
      var answerLabelArea = $("#answer-content-" + answerId);
      var answerButton = $("#answer-button-" + answerId);

      answerLabelArea.show();
      answerLabelArea.text(body);
      answerTextArea.hide();
      answerButton.hide();
    })
  });
});


$(function () {
  $(".edit-answer-button").on("click", function () {
    var answerId = $(this).data("answer-id");
    var answerLabelArea = $("#answer-content-" + answerId);
    var answerTextArea = $("#edit-answer-" + answerId);
    var answerButton = $("#answer-button-" + answerId);

    answerLabelArea.hide();
    answerTextArea.show();
    answerButton.show();
  });
});


$(function () {
  $(".answer-cancel-button").on("click", function () {
    var answerId = $(this).data("cancel-id");
    var answerLabelArea = $("#answer-content-" + answerId);
    var answerTextArea = $("#edit-answer-" + answerId);
    var answerButton = $("#answer-button-" + answerId);

    answerLabelArea.show();
    answerTextArea.hide();
    answerButton.hide();
  });
});

$(function () {
  $(".answer-update-button").on("click", function () {
    var answerId = $(this).data("update-id");
    var answerTextArea = $("#edit-answer-"  + answerId);
    var body = answerTextArea.val();

    $.ajax({
      url: "/answers/" + answerId,
      type: "PATCH",
      data: {
        answer: {
          content: body
        }
      }
    })
    .done(function () {
      var answerLabelArea = $("#answer-content-" + answerId);
      var answerButton = $("#answer-button-" + answerId);

      answerLabelArea.show();
      answerLabelArea.text(body);
      answerTextArea.hide();
      answerButton.hide();
    })
  });
});


