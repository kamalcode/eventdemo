import { NgModule } from '@angular/core';
import { RouterModule, Routes  } from '@angular/router';
import { UniversalModule } from 'angular2-universal';
import { AppComponent } from './components/app/app.component'
import { NavMenuComponent } from './components/navmenu/navmenu.component';
import { HomeComponent } from './components/home/home.component';
import { AppRoutingModule } from './app-routing.module';
import { EventsModule } from './components/events/events.module';


@NgModule({
    bootstrap: [ AppComponent ],
    declarations: [
        AppComponent,
        NavMenuComponent,
        HomeComponent
    ],
    imports: [
        UniversalModule, EventsModule, AppRoutingModule // Must be first import. This automatically imports BrowserModule, HttpModule, and JsonpModule too.
        
    ]
})
export class AppModule {
}
