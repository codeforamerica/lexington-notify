// $(function() {
//   var validator = new FormValidator('citizenForm', [{
//     name: 'citizen[address][mobile_number]',
//     rules: 'required'
//   }, {
//     name: 'citizen[address][street]',
//     rules: 'required'
//   }, {
//     name: 'citizen[email]',
//     rules: 'valid_email|required'
//   }], function(errors, event) {
//     if (errors.length > 0) {
//       $('.js-message-zone').html('<div class="alert alert-danger">Please correct errors below</div>');
//   }
//     errors.forEach(function(error) {
//       $('input[name="' + error.name + '"]').parent('.form-group').addClass('has-error');
//     });
//   });
// });
