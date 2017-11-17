pragma solidity ^0.4.4;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";


contract SmartSensor is usingOraclize {

uint staticClientIndexer;
mapping (uint => Client) clientList;

uint staticSensorIndexer;
mapping (uint => Sensor) sensorList;

string public temp;

function SmartSensor() {
updateTemperature();

}


struct Client {

uint clientID;
address clientAddress;

}

struct Sensor {

uint sensorID;
address sensorAddress;
string sensorReadings;


}

event AddClient(address _clientaddress, uint _clientid);

function addClient(address _clientAddress) returns (uint clientID){

uint clientId = ++staticClientIndexer;
Client c = clientList[clientId];
c.clientID = clientId;
c.clientAddress = _clientAddress;

AddClient(c.clientAddress,c.clientID);

return clientId;

}

function removeClient(){


}

event AddSensor(address _sensoraddress, uint _sensorid);

function addSensor(address _sensorAddress) returns (uint sensorID){

uint sensorId = ++staticSensorIndexer;
Sensor s = sensorList[sensorId];
s.sensorID = sensorId;
s.sensorAddress = _sensorAddress;

AddSensor(s.sensorAddress,s.sensorID);

return sensorId;

}

function removeSensor(){


}

function getDataFromSensor(uint sensorId) returns (string reading){

Sensor sensor_object = sensorList[sensorId];
sensor_object.sensorReadings = getData();
return sensor_object.sensorReadings;

}


function getData() constant returns (string result){
return temp;

}


event newTemperatureMeasure(string temperature);
event newOraclizeQuery(string description);

function __callback(bytes32 _myid, string _result) {

require (msg.sender == oraclize_cbAddress());
temp = _result;
newTemperatureMeasure(temp);
}


function updateTemperature() payable {

newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
oraclize_query("WolframAlpha", "temperature in Rochester");

}



}