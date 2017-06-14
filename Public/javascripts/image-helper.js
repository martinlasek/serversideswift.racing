var profileImage = document.getElementById('profile-image');

if (profileImage != undefined) {

  var xhr = new XMLHttpRequest();
  xhr.open('GET', '/image');
  xhr.send(null);

  xhr.onreadystatechange = function() {
    var DONE = 4;
    var OK = 200;

    if (xhr.readyState === DONE) {

      if (xhr.status === OK) {

        var obj = JSON.parse(xhr.responseText);
        appendImage(obj.url);
      } else {

        console.log('Error: ' + xhr.status); // An error occurred during the request.
      }
    }
  };

  xhr.onreadystatechange();
}

function appendImage(url) {

  var img = document.createElement('img');
  img.setAttribute('src', url);
  img.setAttribute('alt', 'MartinLasek');

  profileImage.removeChild(profileImage.firstElementChild);
  profileImage.appendChild(img);

  img.classList.add('active');
}