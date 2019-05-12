function subscript(bookId) {
  const xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      window.location.reload();
    } else if (this.readyState == 4 && this.status != 200) {
      const res = JSON.parse(this.response);
      alert(res.message.text)
    }
  };
  xhttp.open("POST", "/books/"+bookId+"/subscript", true);
  xhttp.setRequestHeader("X-Requested-With", "XMLHttpRequest");
  xhttp.send();
}

function setMark(bookId, markTagId) {
  const markTag = document.getElementById(markTagId);
  const mark = markTag.options[markTag.selectedIndex].value;
  const xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      window.location.reload();
    } else if (this.readyState == 4 && this.status != 200) {
      const res = JSON.parse(this.response);
      alert(res.message.text)
    }
  };
  xhttp.open("POST", "/books/"+bookId+"/mark/set/"+mark, true);
  xhttp.setRequestHeader("X-Requested-With", "XMLHttpRequest");
  xhttp.send();
}

function unsetMark(bookId, markTagId) {
  const xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      window.location.reload();
    } else if (this.readyState == 4 && this.status != 200) {
      const res = JSON.parse(this.response);
      alert(res.message.text)
    }
  };
  xhttp.open("POST", "/books/"+bookId+"/mark/unset/", true);
  xhttp.setRequestHeader("X-Requested-With", "XMLHttpRequest");
  xhttp.send();
}

