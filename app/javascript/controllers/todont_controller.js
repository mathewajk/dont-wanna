// todont_controlled.js
import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {
    async toggle(event) {
        const request = new FetchRequest('patch', `/to_donts/${event.target.dataset.id}/toggle`, {
            body: JSON.stringify({ to_dont: { completed: event.target.checked } })
        });
        let result = await request.perform();
        // if (result.ok) {
        //     document.getElementById("to_donts").reload();
        //     document.getElementById("completed_to_donts").reload();
        // }
    }

    toggleCompleted(event) {
        console.log(event.target);
        const completedToDonts = document.getElementById("completed_to_donts");
        completedToDonts.classList.toggle("hidden");
        event.target.classList.toggle("open");
    }
}