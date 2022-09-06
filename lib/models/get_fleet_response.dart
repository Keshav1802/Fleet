// To parse this JSON data, do
//
//     final getFleetResponse = getFleetResponseFromJson(jsonString);

import 'dart:convert';

GetFleetResponse getFleetResponseFromJson(String str) => GetFleetResponse.fromJson(json.decode(str));

String getFleetResponseToJson(GetFleetResponse data) => json.encode(data.toJson());

class GetFleetResponse {
  GetFleetResponse({
    this.code,
    this.data,
    this.message,
  });

  int code;
  Data data;
  String message;

  factory GetFleetResponse.fromJson(Map<String, dynamic> json) => GetFleetResponse(
    code: json["code"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.fleetName,
    this.insights,
  });

  String fleetName;
  Insights insights;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    fleetName: json["fleet_name"],
    insights: Insights.fromJson(json["insights"]),
  );

  Map<String, dynamic> toJson() => {
    "fleet_name": fleetName,
    "insights": insights.toJson(),
  };
}

class Insights {
  Insights({
    this.trips,
    this.fleet,
    this.ledger,
  });

  Trips trips;
  Fleet fleet;
  Ledger ledger;

  factory Insights.fromJson(Map<String, dynamic> json) => Insights(
    trips: Trips.fromJson(json["trips"]),
    fleet: Fleet.fromJson(json["fleet"]),
    ledger: Ledger.fromJson(json["ledger"]),
  );

  Map<String, dynamic> toJson() => {
    "trips": trips.toJson(),
    "fleet": fleet.toJson(),
    "ledger": ledger.toJson(),
  };
}

class Fleet {
  Fleet({
    this.trucks,
    this.activeTrips,
    this.avgIdleTime,
    this.avgMileage,
    this.growth,
  });

  int trucks;
  int activeTrips;
  Avg avgIdleTime;
  Avg avgMileage;
  String growth;

  factory Fleet.fromJson(Map<String, dynamic> json) => Fleet(
    trucks: json["trucks"],
    activeTrips: json["active_trips"],
    avgIdleTime: Avg.fromJson(json["avg_idle_time"]),
    avgMileage: Avg.fromJson(json["avg_mileage"]),
    growth: json["growth"],
  );

  Map<String, dynamic> toJson() => {
    "trucks": trucks,
    "active_trips": activeTrips,
    "avg_idle_time": avgIdleTime.toJson(),
    "avg_mileage": avgMileage.toJson(),
    "growth": growth,
  };
}

class Avg {
  Avg({
    this.value,
    this.unit,
  });

  String value;
  String unit;

  factory Avg.fromJson(Map<String, dynamic> json) => Avg(
    value: json["value"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "unit": unit,
  };
}

class Ledger {
  Ledger({
    this.earnings,
    this.expense,
    this.profit,
  });

  String earnings;
  String expense;
  String profit;

  factory Ledger.fromJson(Map<String, dynamic> json) => Ledger(
    earnings: json["earnings"],
    expense: json["expense"],
    profit: json["profit"],
  );

  Map<String, dynamic> toJson() => {
    "earnings": earnings,
    "expense": expense,
    "profit": profit,
  };
}

class Trips {
  Trips({
    this.total,
    this.avgDays,
    this.avgDistance,
    this.avgRevenue,
    this.avgExpenses,
    this.avgProfit,
  });

  String total;
  String avgDays;
  String avgDistance;
  String avgRevenue;
  String avgExpenses;
  String avgProfit;

  factory Trips.fromJson(Map<String, dynamic> json) => Trips(
    total: json["total"],
    avgDays: json["avg_days"],
    avgDistance: json["avg_distance"],
    avgRevenue: json["avg_revenue"],
    avgExpenses: json["avg_expenses"],
    avgProfit: json["avg_profit"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "avg_days": avgDays,
    "avg_distance": avgDistance,
    "avg_revenue": avgRevenue,
    "avg_expenses": avgExpenses,
    "avg_profit": avgProfit,
  };
}
