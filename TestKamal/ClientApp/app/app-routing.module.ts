import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { eventComponent } from './components/events/event.component';
import { EventDetailComponent } from './components/events/eventdetail.component'
const appRoutes: Routes = [
    { path: 'home', redirectTo: 'events', pathMatch: 'full' },
  //  { path: 'events', component: eventComponent },
    { path: '', redirectTo: 'events', pathMatch: 'full' },
    { path: '**', redirectTo: 'events' }
   // { path: 'eventdetail', component: EventDetailComponent }]
    ]

@NgModule({
    imports: [
        RouterModule.forRoot(appRoutes)
    ],
    exports: [
        RouterModule
    ]
})
export class AppRoutingModule { }
