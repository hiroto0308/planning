function comment() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", " /events/:event_id", true);
    XHR.responseType = "json";
    XHR.contentType = "application/json"
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
    const item = XHR.response.post;
    
    const formText = document.getElementById("text");
    const HTML = `
       <p>
       <strong><%= link_to comment.user.nickname, root_path %>：</strong>
         ${item.text} 
       <%= link_to '(削除)', comment_path(comment.id), method: :delete %>
       </p>`;
    //  list.insertAdjacentHTML("afterend", HTML);
     formText.value = "";  
    };
    e.preventDefault();
  });
}
window.addEventListener("load", comment);