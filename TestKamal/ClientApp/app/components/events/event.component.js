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
var dataService_1 = require("../../services/dataService");
var router_1 = require("@angular/router");
var eventComponent = (function () {
    function eventComponent(dataService, router) {
        this.dataService = dataService;
        this.router = router;
        this.pageSize = 5;
        this.range = function (start, end) { return (Array.from(Array(end - start + 1).keys()).map(function (i) { return i + start; })); };
        this._pageNumber = 1;
        this._pageNumber = 1;
        this.pageSize = 5;
    }
    eventComponent.prototype.ngOnInit = function () {
        this.getEventPage(this.PageNumber, this.pageSize);
    };
    eventComponent.prototype.onSelect = function (id) {
        this.router.navigate(['/eventdetail', id]);
    };
    Object.defineProperty(eventComponent.prototype, "PageNumber", {
        get: function () {
            return this._pageNumber;
        },
        set: function (value) {
            if (value != this._pageNumber) {
                this._pageNumber = value;
                this.getEventPage(this._pageNumber, this.pageSize);
            }
        },
        enumerable: true,
        configurable: true
    });
    eventComponent.prototype.getEventPage = function (page, pageSize) {
        var _this = this;
        this.dataService.getEventPage(page, pageSize).subscribe(function (ret) {
            _this.data = ret.data;
            _this.total = ret.total;
            _this.totalPages = _this.range(1, Math.ceil(_this.total / _this.pageSize));
        });
    };
    eventComponent.prototype.getImagePath = function (id) {
        return require("../../Images/test" + id + ".jpg");
    };
    return eventComponent;
}());
eventComponent = __decorate([
    core_1.Component({
        selector: 'event',
        template: require('./event.component.html'),
        providers: [dataService_1.DataService],
    }),
    __metadata("design:paramtypes", [dataService_1.DataService, router_1.Router])
], eventComponent);
exports.eventComponent = eventComponent;
//# sourceMappingURL=event.component.js.map