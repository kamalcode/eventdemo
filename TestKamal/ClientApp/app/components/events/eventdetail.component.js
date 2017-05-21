"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
var core_1 = require("@angular/core");
var router_1 = require("@angular/router");
var dataService_1 = require("../../services/dataService");
require("rxjs/add/operator/switchMap");
var EventDetailComponent = (function () {
    function EventDetailComponent(route, router, dataService) {
        this.route = route;
        this.router = router;
        this.dataService = dataService;
        this.eventDetails = null;
    }
    EventDetailComponent.prototype.ngOnInit = function () {
        this.eventId = +this.route.snapshot.params['id'];
        this.getEventDetails(this.eventId);
    };
    EventDetailComponent.prototype.getEventDetails = function (eventId) {
        var _this = this;
        this.dataService.getEvent(eventId).subscribe(function (ret) {
            _this.eventDetails = ret;
        });
    };
    EventDetailComponent.prototype.getImagePath = function (id) {
        return require("../../Images/test" + id + ".jpg");
    };
    return EventDetailComponent;
}());
EventDetailComponent = __decorate([
    core_1.Component({
        selector: 'eventdetail',
        template: require('./eventdetail.component.html')
    }),
    __metadata("design:paramtypes", [router_1.ActivatedRoute,
        router_1.Router,
        dataService_1.DataService])
], EventDetailComponent);
exports.EventDetailComponent = EventDetailComponent;
//# sourceMappingURL=eventdetail.component.js.map