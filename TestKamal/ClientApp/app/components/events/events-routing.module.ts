import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { eventComponent } from './event.component';
import { EventDetailComponent } from './eventdetail.component'

const eventsRoutes: Routes = [
    { path: 'events', component: eventComponent },
    { path: 'eventdetail/:id', component: EventDetailComponent }
];
@NgModule({
    imports: [
        RouterModule.forChild(eventsRoutes)
    ],
    exports: [
        RouterModule
    ]
})
export class EventRoutingModule { }
