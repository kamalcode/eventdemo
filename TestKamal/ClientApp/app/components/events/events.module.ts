import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { eventComponent } from './event.component';
import { EventDetailComponent } from './eventdetail.component'
import { DataService } from "../../services/dataService";
import { EventRoutingModule } from "./events-routing.module";
@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        EventRoutingModule
    ],
    declarations: [
        eventComponent,
        EventDetailComponent
    ],
    providers: [DataService]
})
export class EventsModule { }
