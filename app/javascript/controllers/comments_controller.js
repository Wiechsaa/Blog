import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {}
  connect() {}
  toggleForm(event) {
    event.preventDefault();
    event.stopPropagation();

    const formID = event.params['form'];
    const commentBodyID = event.params['body'];
    const editButtonID = event.params['edit']

    const form = document.getElementById(formID);
    const commentBody = document.getElementById(commentBodyID);
    const editButton = document.getElementById(editButtonID);

    form.classList.toggle('d-none');
    form.classList.toggle('mt-5');

    commentBody.classList.toggle('d-none');

    this.toggleEditButton(editButton);
  }
  toggleEditButton(editButton) {
    if (editButton.innerText === 'Edit') {
      editButton.innerText = 'Cancel';
      editButton.classList.toggle('btn-warning')
      editButton.classList.toggle('btn-secondary')
    } else { 
      editButton.innerText = 'Edit';
      editButton.classList.toggle('btn-warning')
      editButton.classList.toggle('btn-secondary')
    }
  }
}
