(function() {
  const selectedImg = document.getElementById('gallery_selected');
  const images = document.getElementById('gallery_image_list').getElementsByTagName('li');
  for (let i = 0; i < images.length; i++) {
    images[i].addEventListener('click', activateImage);
  }
  function activateImage() {
    selectedImg.innerHTML = this.innerHTML;
  }
})()