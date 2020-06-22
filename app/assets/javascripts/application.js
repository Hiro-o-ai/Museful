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
  $(document).on("click", ".edit-answer-button", function () {
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
  $(document).on("click", ".answer-cancel-button", function () {
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
  $(document).on("click", ".answer-update-button", function () {
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
  $(document).on("click", ".edit-comment-button", function () {
    var commentId = $(this).data("comment-id");
    var commentLabelArea = $("#comment-content-" + commentId);
    var commentTextArea = $("#edit-comment-" + commentId);
    var commentButton = $("#comment-button-" + commentId);

    commentLabelArea.hide();
    commentTextArea.show();
    commentButton.show();
  });
});


$(function () {
  $(document).on("click", ".comment-cancel-button",function () {
    var commentId = $(this).data("cancel-id");
    var commentLabelArea = $("#comment-content-" + commentId);
    var commentTextArea = $("#edit-comment-" + commentId);
    var commentButton = $("#comment-button-" + commentId);

    commentLabelArea.show();
    commentTextArea.hide();
    commentButton.hide();
  });
});

$(function () {
  $(document).on("click", ".comment-update-button", function () {
    var commentId = $(this).data("update-id");
    var commentTextArea = $("#edit-comment-"  + commentId);
    var body = commentTextArea.val();

    $.ajax({
      url: "/comments/" + commentId,
      type: "PATCH",
      data: {
        comment: {
          content: body
        }
      }
    })
    .done(function () {
      var commentLabelArea = $("#comment-content-" + commentId);
      var commentButton = $("#comment-button-" + commentId);

      commentLabelArea.show();
      commentLabelArea.text(body);
      commentTextArea.hide();
      commentButton.hide();
    })
  });
});

