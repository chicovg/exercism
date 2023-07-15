import ballerina/http;

// Client endpoint to communicate with Airline reservation service
final http:Client airlineReservationEP = check new ("http://localhost:9091/airline");

// Client endpoint to communicate with Hotel reservation service
final http:Client hotelReservationEP = check new ("http://localhost:9092/hotel");

// Client endpoint to communicate with Car rental service
final http:Client carRentalEP = check new ("http://localhost:9093/car");

// Travel agency service to arrange a complete tour for a user
service /travel on new http:Listener(9090) {

    // Define a resource method to arrange a tour, that accepts `POST` requests in the path `/arrangeTour`.
    // This resource should accept a value of the type `TourArrangement` that already defined below.
    resource function post arrangeTour(@http:Payload TourArrangement tourArrangement) returns http:Created|http:BadRequest|error {
        Preference preference = tourArrangement.preference;

	    ServiceResponse airlineReservationResponse = check airlineReservationEP->/reserve.post({
            "name": tourArrangement.name,
            "arrivalDate": tourArrangement.arrivalDate,
            "departureDate": tourArrangement.departureDate,
            "preference": preference.airline
        });

        if airlineReservationResponse.status == FAILED {
            http:BadRequest badRequest = {
                body: {
                    message: "Failed to reserve airline! Provide a valid 'preference' for 'airline' and try again"
                }
            };
            return badRequest;
        }

        ServiceResponse hotelReservationResponse = check hotelReservationEP->/reserve.post({
            "name": tourArrangement.name,
            "arrivalDate": tourArrangement.arrivalDate,
            "departureDate": tourArrangement.departureDate,
            "preference": preference.accomodation
        });

        if hotelReservationResponse.status == FAILED {
            http:BadRequest badRequest = {
                body: {
                    message: "Failed to reserve hotel! Provide a valid 'preference' for 'accommodation' and try again"
                }
            };
            return badRequest;
        }
        
        ServiceResponse carRentalResponse = check carRentalEP->/rent.post({
            "name": tourArrangement.name,
            "arrivalDate": tourArrangement.arrivalDate,
            "departureDate": tourArrangement.departureDate,
            "preference": preference.car
        });

        if carRentalResponse.status == FAILED {
            http:BadRequest badRequest = {
                body: {
                    message: "Failed to rent car! Provide a valid 'preference' for 'car' and try again"
                }
            };
            return badRequest;
        }

        http:Created response = {
            body: {
                message: "Congratulations! Your journey is ready!!"
            }
        };
        return response;
    }
}

# The payload type received from the tour arrangement service.
#
# + name - Name of the tourist
# + arrivalDate - The arrival date of the tourist
# + departureDate - The departure date of the tourist
# + preference - The preferences for the airline, hotel, and the car rental
type TourArrangement record {|
    string name;
    string arrivalDate;
    string departureDate;
    Preference preference;
|};

# The different prefenrences for the tour.
#
# + airline - The preference for airline ticket. Can be `First`, `Bussiness`, `Economy`
# + accomodation - The prefenerece for the hotel reservarion. Can be `delux` or `superior`
# + car - The preference for the car rental. Can be `air conditioned`, or `normal`
type Preference record {|
    string airline;
    string accomodation;
    string car;
|};

// Define a record type to send requests to the reservation services.
type Reservation record {|
    string name;
    string arrivalDate;
    string departureDate;
    string preference;
|};

// The response type received from the reservation services
type ServiceResponse record {|
    Status status;
|};

// Possible statuses of the reservation service responses
enum Status {
    SUCCESS = "Success",
    FAILED = "Failed"
}
