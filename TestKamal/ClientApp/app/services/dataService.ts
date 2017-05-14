﻿import { Injectable } from '@angular/core';
import { Http, Response  } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { Event } from "../models/event";
import { PagedResponse } from "../models/PagedResponse";
import { EventDetails } from "../models/EventDetails";
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

@Injectable()
export class DataService {
    private apiUrl = "/api/eventproxy/events";
    constructor(private http: Http)
    {
    }
    getEvents(): Observable<Event[]> {
        return this.http.get(this.apiUrl)
            .map(this.extractData)
            .catch(this.handleError);
    }
    private extractData(res: Response) {
        let body = res.json();
        return body || {};
    }
    private handleError(error: Response | any) {
        // In a real world app, you might use a remote logging infrastructure
        let errMsg: string;
        if (error instanceof Response) {
            const body = error.json() || '';
            const err = body.error || JSON.stringify(body);
            errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
        } else {
            errMsg = error.message ? error.message : error.toString();
        }
        
        return Observable.throw(errMsg);
    }

    getEventPage(page: number, pageSize: number):Observable<PagedResponse> {
        return this.http.get(`/api/eventproxy/events/${page}/${pageSize}`)
            .map(this.extractData);
           
    }

    getEvent(eventId: number): Observable<EventDetails> {
        return this.http.get(`/api/eventproxy/event/${eventId}`)
            .map(this.extractData);

    }

}