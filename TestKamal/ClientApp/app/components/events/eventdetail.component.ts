import { Component } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { DataService } from "../../services/dataService";
import 'rxjs/add/operator/switchMap';
import { EventDetails } from "../../models/EventDetails";

@Component({
    selector: 'eventdetail',
    template: require('./eventdetail.component.html')
})
export class EventDetailComponent {
    private eventId: number;
    private eventDetails: EventDetails=null;
    constructor(
        private route: ActivatedRoute,
        private router: Router,
        private dataService: DataService
        
    )
     { 

    }
    ngOnInit() {
        this.eventId = +this.route.snapshot.params['id'];
        this.getEventDetails(this.eventId);

    }

    getEventDetails(eventId: number) {
        this.dataService.getEvent(eventId).subscribe(
            ret => {
                this.eventDetails = ret;
            }
        );
    }
    getImagePath(id: number) {
        return require(`../../Images/test${id}.jpg`);
    }
}
