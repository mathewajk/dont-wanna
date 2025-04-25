// todont_controlled.js
import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {
    async toggleContacted(event) {
        const request = new FetchRequest('patch', `/rental_listings/${event.target.dataset.id}/toggle_contacted`, {
            body: JSON.stringify({ rental_listing: { contacted: event.target.checked } })
        });
    }

    async toggleInterested(event) {
        const request = new FetchRequest('patch', `/rental_listings/${event.target.dataset.id}/toggle_interested`, {
            body: JSON.stringify({ rental_listing: { interested: event.target.checked } })
        });
    }
}