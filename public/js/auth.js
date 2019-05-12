const checkPassword = function() {
  const message = document.getElementById('message');
  const passwordVal = document.getElementById('password').value;
  const passwordConfirmVal = document.getElementById('password_confirm').value;
  if (passwordVal && !passwordConfirmVal) {
    message.innerHTML = '';
    return false;
  }
  if (passwordVal === passwordConfirmVal) {
    message.style.color = 'green';
    message.innerHTML = 'Пароль співпадає';
    return true;
  } else {
    message.style.color = 'red';
    message.innerHTML = 'Пароль не співпадає';
  }
  return false; 
}

const onSignup = function(e) {
  if (!checkPassword()) {
    e.preventDefault();
    return false;
  };
  return true;
}
