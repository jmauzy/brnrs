import Formsy from 'formsy-react';

(function() {
  Formsy.addValidationRule('redirectsValidator', function(values, value, maxValue) {
    return(!isNaN(value) && 0 <= value && value <= maxValue);
  });

  Formsy.addValidationRule('expirationValidator', function(values, value) {
    return(!isNaN(value) && value > moment().unix() && value < moment().add(1, 'year').unix());
  });
})();

module.exports = {

  urlRegexp: /^(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$/
}

