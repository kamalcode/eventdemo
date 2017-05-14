import { Component, OnInit,Directive} from '@angular/core';
import { Http } from "@angular/http";
import { Event } from "../../models/event";
import { DataService } from "../../services/dataService";
import { Observable } from 'rxjs/Rx';
import { PagedResponse } from "../../models/PagedResponse";
import { Router } from '@angular/router';

@Component({
    selector: 'event',
    template: require('./event.component.html'),
    providers: [DataService],
   
    
})
export class eventComponent implements OnInit {   
    //private events: Event[] = [];
    events: Observable<Event[]>;
    data: any[];
    total: number;
    totalPages: any;
    pageSize: number = 5;
    private range = (start, end) => (
        Array.from(Array(end - start + 1).keys()).map(i => i + start)
    );
    private errorMessage: string;
    constructor(private dataService: DataService, private router: Router) {
        this._pageNumber = 1;
        this.pageSize = 5;
    }

    ngOnInit() {
        this.getEventPage(this.PageNumber, this.pageSize);
       
    }

    onSelect(id: number) {

        this.router.navigate(['/eventdetail', id]);
    }

   
    private _pageNumber: number = 1;
    get PageNumber(): number {
        return this._pageNumber;
    }
    set PageNumber(value: number) {
        if (value != this._pageNumber)
        {
            this._pageNumber = value;
            this.getEventPage(this._pageNumber, this.pageSize);

        }

    }

    getEventPage(page: number, pageSize: number) {
        this.dataService.getEventPage(page, pageSize).subscribe(
            ret => {
                this.data = ret.data;
                this.total = ret.total;
                this.totalPages = this.range(1, Math.ceil(this.total / this.pageSize));
            } 
        );
    }

    getImagePath(id:number)
    {
        return require(`../../Images/test${id}.jpg`);
    }
}



