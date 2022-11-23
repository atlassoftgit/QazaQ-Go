import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:ridy/location_selection/location_selection_parent_view.dart';
import 'package:ridy/location_selection/welcome_card/place_search_sheet_view.dart';
import '../../graphql/generated/graphql_api.graphql.dart';

// Events
abstract class MainBlocEvent {}

class MapMoved extends MainBlocEvent {
  LatLng latlng;

  MapMoved(this.latlng);
}

class ResetState extends MainBlocEvent {}

class DriverLocationUpdatedEvent extends MainBlocEvent {
  PointMixin location;

  DriverLocationUpdatedEvent(this.location);
}

class ShowPreview extends MainBlocEvent {
  List<FullLocation> points;
  List<String> selectedOptions;
  String? couponCode;

  ShowPreview(
      {required this.points, required this.selectedOptions, this.couponCode});
}

class SelectService extends MainBlocEvent {
  GetFare$Query$CalculateFareDTO$ServiceCategory$Service service;

  SelectService(this.service);
}

class SelectBookingTime extends MainBlocEvent {
  DateTime time;

  SelectBookingTime(this.time);
}

class ProfileUpdated extends MainBlocEvent {
  GetCurrentOrder$Query$Rider profile;
  PointMixin? driverLocation;

  ProfileUpdated({required this.profile, this.driverLocation});
}

class VersionStatusEvent extends MainBlocEvent {
  VersionStatus status;
  VersionStatusEvent(this.status);
}

class CurrentOrderUpdated extends MainBlocEvent {
  CurrentOrderMixin order;
  PointMixin? driverLocation;

  CurrentOrderUpdated(this.order, {this.driverLocation});
}

class SetDriversLocations extends MainBlocEvent {
  List<LatLng> driversLocations;

  SetDriversLocations(this.driversLocations);
}

// States
abstract class MainBlocState {
  List<MarkerData> markers;
  bool isInteractive;
  int bookedOrdersCount;

  MainBlocState(
      {required this.isInteractive,
      required this.markers,
      this.bookedOrdersCount = 0});
}

class RequireUpdateState extends MainBlocState {
  RequireUpdateState() : super(isInteractive: false, markers: []);
}

class SelectingPoints extends MainBlocState {
  List<FullLocation> points = [];
  List<LatLng> driverLocations = [];
  bool loadDrivers;
  int bookingsCount = 0;

  SelectingPoints(this.points, this.driverLocations, this.loadDrivers,
      {this.bookingsCount = 0})
      : super(
            isInteractive: true,
            markers: points
                .take(1)
                .map((e) => MarkerData(e.latlng.latitude.toString(), e.latlng,
                    'images/marker_pickup.png', MarkerType.pickup))
                .followedBy(points.skip(1).map((e) => MarkerData(
                    e.latlng.latitude.toString(),
                    e.latlng,
                    'images/marker_destination.png',
                    MarkerType.destination)))
                .followedBy(driverLocations
                    .map((e) => MarkerData(e.latitude.toString(), e,
                        "images/marker_taxi.png", MarkerType.driver))
                    .toList())
                .toList());
}

class OrderPreview extends MainBlocState {
  List<FullLocation> points = [];
  List<String> selectedOptions = [];
  String? couponCode;
  GetFare$Query$CalculateFareDTO$ServiceCategory$Service? selectedService;

  OrderPreview(this.points, this.selectedOptions, this.couponCode,
      {this.selectedService})
      : super(
            isInteractive: false,
            markers: points
                .take(1)
                .map((e) => MarkerData(e.latlng.latitude.toString(), e.latlng,
                    'images/marker_pickup.png', MarkerType.pickup))
                .followedBy(points.skip(1).map((e) => MarkerData(
                    e.latlng.latitude.toString(),
                    e.latlng,
                    'images/marker_destination.png',
                    MarkerType.destination)))
                .toList());
}

class StateWithActiveOrder extends MainBlocState {
  CurrentOrderMixin currentOrder;
  List<FullLocation> locations;

  StateWithActiveOrder(this.currentOrder, {this.locations = const []})
      : super(isInteractive: false, markers: const []);
}

class OrderLooking extends StateWithActiveOrder {
  CurrentOrderMixin order;

  OrderLooking(this.order)
      : super(order,
            locations: order.addresses
                .asMap()
                .entries
                .map((e) => FullLocation(
                    latlng: order.points[e.key].toLatLng(),
                    address: order.addresses[e.key],
                    title: "title"))
                .toList());
}

class OrderInProgress extends StateWithActiveOrder {
  CurrentOrderMixin order;
  LatLng? driverLocation;

  OrderInProgress(this.order, {this.driverLocation}) : super(order) {
    switch (order.status) {
      case OrderStatus.driverAccepted:
      case OrderStatus.arrived:
        markers = [
          MarkerData(
              order.points[0].lat.toString(),
              LatLng(order.points[0].lat, order.points[0].lng),
              'images/marker_pickup.png',
              MarkerType.pickup)
        ];
        break;

      case OrderStatus.started:
        markers = order.points
            .sublist(1)
            .map((point) => MarkerData(
                point.lat.toString(),
                LatLng(point.lat, point.lng),
                'images/marker_destination.png',
                MarkerType.destination))
            .toList();
        break;

      default:
    }
    if (driverLocation != null) {
      markers.add(MarkerData(driverLocation!.latitude.toString(),
          driverLocation!, 'images/marker_taxi.png', MarkerType.driver));
    }
  }
}

class OrderInvoice extends StateWithActiveOrder {
  CurrentOrderMixin order;

  OrderInvoice(this.order) : super(order);
}

class OrderReview extends StateWithActiveOrder {
  CurrentOrderMixin order;

  OrderReview(this.order) : super(order);
}

class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  MainBloc() : super(SelectingPoints([], [], true)) {
    on<VersionStatusEvent>(((event, emit) => emit(RequireUpdateState())));

    on<MapMoved>((event, emit) {
      if (state is! SelectingPoints) return;
      emit(SelectingPoints((state as SelectingPoints).points, [], true,
          bookingsCount: (state as SelectingPoints).bookingsCount));
    });

    on<ResetState>((event, emit) => emit(SelectingPoints([], [], true)));

    on<ShowPreview>((event, emit) => emit(
        OrderPreview(event.points, event.selectedOptions, event.couponCode)));

    on<SelectService>((event, emit) => emit(OrderPreview(
        (state as OrderPreview).points,
        (state as OrderPreview).selectedOptions,
        (state as OrderPreview).couponCode,
        selectedService: event.service)));

    on<ProfileUpdated>((event, emit) {
      LatLng? driverLocation = event.driverLocation?.toLatLng();
      if (driverLocation == null &&
          state is OrderInProgress &&
          (state as OrderInProgress).driverLocation != null) {
        driverLocation = (state as OrderInProgress).driverLocation;
      }
      int bookings = event.profile.bookedOrders.first.count?.id ?? 0;
      if (event.profile.orders.isEmpty &&
          (state is! SelectingPoints || state is! OrderPreview)) {
        emit(SelectingPoints([], [], true, bookingsCount: bookings));
        return;
      }
      GetCurrentOrder$Query$Rider$Order order = event.profile.orders.first;
      switch (order.status) {
        case OrderStatus.requested:
        case OrderStatus.notFound:
        case OrderStatus.noCloseFound:
        case OrderStatus.found:
        case OrderStatus.booked:
          emit(OrderLooking(order));
          return;

        case OrderStatus.driverAccepted:
        case OrderStatus.arrived:
        case OrderStatus.started:
          emit(OrderInProgress(order, driverLocation: driverLocation));
          return;

        case OrderStatus.expired:
        case OrderStatus.finished:
        case OrderStatus.riderCanceled:
        case OrderStatus.driverCanceled:
        case OrderStatus.artemisUnknown:
          if (state is! SelectingPoints || state is! OrderPreview) {
            emit(SelectingPoints([], [], true, bookingsCount: bookings));
          }
          return;

        case OrderStatus.waitingForPostPay:
        case OrderStatus.waitingForPrePay:
          emit(OrderInvoice(order));
          return;

        case OrderStatus.waitingForReview:
          emit(OrderReview(order));
          return;
      }
    });

    on<CurrentOrderUpdated>(((event, emit) {
      LatLng? driverLocation = event.driverLocation?.toLatLng();

      if (driverLocation == null &&
          state is OrderInProgress &&
          (state as OrderInProgress).driverLocation != null) {
        driverLocation = (state as OrderInProgress).driverLocation;
      }
      if (state is StateWithActiveOrder &&
          (state as StateWithActiveOrder).currentOrder.status ==
              event.order.status) {
        return;
      }
      switch (event.order.status) {
        case OrderStatus.requested:
        case OrderStatus.notFound:
        case OrderStatus.noCloseFound:
        case OrderStatus.found:
        case OrderStatus.booked:
          emit(OrderLooking(event.order));
          return;

        case OrderStatus.driverAccepted:
        case OrderStatus.arrived:
        case OrderStatus.started:
          emit(OrderInProgress(event.order, driverLocation: driverLocation));
          return;

        case OrderStatus.expired:
        case OrderStatus.finished:
        case OrderStatus.riderCanceled:
        case OrderStatus.driverCanceled:
        case OrderStatus.artemisUnknown:
          emit(SelectingPoints([], [], true, bookingsCount: 0));
          return;

        case OrderStatus.waitingForPostPay:
        case OrderStatus.waitingForPrePay:
          emit(OrderInvoice(event.order));
          return;

        case OrderStatus.waitingForReview:
          emit(OrderReview(event.order));
          return;
      }
    }));

    on<DriverLocationUpdatedEvent>((event, emit) {
      if (state is OrderInProgress) {
        emit(OrderInProgress((state as OrderInProgress).currentOrder,
            driverLocation: LatLng(event.location.lat, event.location.lng)));
      }
    });
    on<SetDriversLocations>((event, emit) => emit(SelectingPoints(
        (state as SelectingPoints).points, event.driversLocations, false,
        bookingsCount: (state as SelectingPoints).bookingsCount)));
  }
}

class MarkerData {
  String id;
  LatLng position;
  String assetAddress;
  MarkerType markerType;

  MarkerData(this.id, this.position, this.assetAddress, this.markerType);
}

enum MarkerType { pickup, destination, driver }

extension RiderAddressToFullLocation on CurrentOrderMixin$Point {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }
}
