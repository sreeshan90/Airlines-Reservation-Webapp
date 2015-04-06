/**
 * Created by sreesha.n on 30-03-2015.
 */
var app = angular.module('myApp', []);

app.controller('tabController', function($scope, $http) {

    $('li.notactive').click(function() {

        if(this.id == "flight"){
            $("#searchFlights").css("display","block");
            $("#findSeats").css("display","none");
            $("#passengerList").css("display","none");
            $("#fareList").css("display","none");
            $("#flightInstance").css("display","none");
        }

        if(this.id == "seats"){
            $("#searchFlights").css("display","none");
            $("#passengerList").css("display","none");
            $("#findSeats").css("display","block");
            $("#fareList").css("display","none");
            $("#flightInstance").css("display","none");
        }
        if(this.id == "pass"){
            $("#searchFlights").css("display","none");
            $("#passengerList").css("display","block");
            $("#findSeats").css("display","none");
            $("#fareList").css("display","none");
            $("#flightInstance").css("display","none");

        }

        if(this.id == "fare"){
            $("#searchFlights").css("display","none");
            $("#passengerList").css("display","none");
            $("#findSeats").css("display","none");
            $("#fareList").css("display","block");
            $("#flightInstance").css("display","none");
        }
        if(this.id == "inst"){

            $("#searchFlights").css("display","none");
            $("#passengerList").css("display","none");
            $("#findSeats").css("display","none");
            $("#fareList").css("display","none");
            $("#flightInstance").css("display","block");
        }
    });
});

app.controller('searchFlights', function($scope, $http) {


var sel="zero";
    $(".rad").click(function() {
        // whenever a button is clicked, set the hidden helper
        //alert($(this).val());
        sel = $(this).val();
    });


    $scope.findFlights = function(){

        if(sel == "zero"){
            $("#tab0").css("display","block");
            $("#tab1").css("display","none");
            $("#tab2").css("display","none");
            $("#tab3").css("display","none");
        }
        else if(sel == "one"){
            $("#tab0").css("display","none");
            $("#tab1").css("display","block");
            $("#tab2").css("display","none");
            $("#tab3").css("display","none");
        }
        else if(sel == "two"){
            $("#tab0").css("display","none");
            $("#tab1").css("display","none");
            $("#tab2").css("display","block");
            $("#tab3").css("display","none");
        }
        else if(sel == "three"){
            $("#tab0").css("display","none");
            $("#tab1").css("display","none");
            $("#tab2").css("display","none");
            $("#tab3").css("display","block");
        }

            $http.get("http://localhost/angular-cellar-master/api/flights/search/bycode/"+sel+"/"+$scope.dep+"/"+$scope.arr)
                .success(function (response) {


                    $scope.names = response;})

                .error(function (message){
                    alert("error")
                    alert(message);
                });
        };



});

app.controller('findSeats', function($scope, $http) {


    $scope.findSeats = function(){


        $http.get("http://localhost/angular-cellar-master/api/flights/search/seats/"+$scope.fNum+"/"+$scope.date)
            .success(function (response) {

                $scope.seats = response;})

            .error(function (message){
                alert("error")
                alert(message);
            });
    };




});

app.controller('passengerList', function($scope, $http) {


    $scope.findPassengers = function(){


        $http.get("http://localhost/angular-cellar-master/api/flights/search/passenger/"+$scope.fNum+"/"+$scope.date)
            .success(function (response) {


                $scope.flights = response;})

            .error(function (message){
                alert("error")
                alert(message);
            });
    };




});

app.controller('fareList', function($scope, $http) {


    $scope.fareList = function(){


        $http.get("http://localhost/angular-cellar-master/api/flights/search/fare/"+$scope.fNum)
            .success(function (response) {


                $scope.fare = response;})

            .error(function (message){
                alert("error")
                alert(message);
            });
    };




});

app.controller('flightInstance', function($scope, $http) {


    $scope.flightInstance = function(){


        $http.get("http://localhost/angular-cellar-master/api/flights/search/instances/"+$scope.cName)
            .success(function (response) {

                $scope.flightList = response;})

            .error(function (message){
                alert("error")
                alert(message);
            });
    };




});