import { EventDate } from "./EventDate";
import { EventImage } from "./EventImage";


export interface EventDetails {
    eventId: Number;
    eventName: string;
    eventDates: EventDate[];
    eventImages: EventImage[];
} 