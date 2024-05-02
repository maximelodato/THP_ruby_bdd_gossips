import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
$(document).ready(function() {
    $('#signup-link').click(function() {
      $('#signup-modal').show();
    });
  });