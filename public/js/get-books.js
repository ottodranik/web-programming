
const authors = document.getElementById('filter-authors').getElementsByTagName('input');
for (let i = 0; i < authors.length; i++) {
  authors[i].addEventListener('change', getBooks);
}
const mark = document.getElementById('filter-mark');
mark.addEventListener('change', getBooks);

function getBooks() {
  var xhttp = new XMLHttpRequest();
  const selectedAuthors = [];
  for (let i = 0; i < authors.length; i++) {
    if (authors[i].checked) {
      selectedAuthors.push(authors[i].value);
    }
  }
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("book-list").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "?mark="+mark.value+"&authors="+selectedAuthors, true);
  xhttp.setRequestHeader("X-Requested-With", "XMLHttpRequest");
  xhttp.send();
}