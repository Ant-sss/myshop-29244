import consumer from "./consumer"

consumer.subscriptions.create("CommentsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // const htmlname = `<p>販売責任者 ${data.content.created_at}</p>`;
    const html = `<div>販売責任者： ${data.content.text}</div>`;

    const comments = document.getElementById("comments");
    const newComment = document.getElementById("itemcomment_text");
    // comments.insertAdjacentHTML('afterbegin', htmlname);
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
    // Called when there's incoming data on the websocket for this channel
  }
});
