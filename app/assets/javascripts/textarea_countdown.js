function countdown(message, feedback) {
  var textMax = message.prop('maxlength');
  var setFeedback = function(charsRemaining) {
    feedback.html(charsRemaining + ' characters remaining');
  }

  message.keyup(function() {
    var messageLength = message.val().length;
    var charsRemaining = textMax - messageLength;
    setFeedback(charsRemaining);
  });

  setFeedback(textMax);
}

$(document).ready(function() {
  countdown($('#sms_message'), $('#sms_feedback'));
});
