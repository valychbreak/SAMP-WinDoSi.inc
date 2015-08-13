#include <a_samp>
#include <zcmd>
#include <sscanf>

#define VEHICLE_WDS_DEBUG
#include <VehicleWDSControl>

public OnFilterScriptInit()
{
	print("Vehicle Windows/Doors/Siren Control Example");
}

CMD:veh(playerid, params[])
{
	new modelid;
	if(sscanf(params, "d", modelid)) return SendClientMessage(playerid, -1, "USAGE: /veh [modelid]");
	if(modelid > 611 || modelid < 400) return SendClientMessage(playerid, -1, "Wrong modelid.");
	new Float: x, Float: y, Float: z;
	GetPlayerPos(playerid, x,y,z);
	new id = CreateVehicle(modelid, x+4, y, z, 0, random(128), random(128), -1);
	
	new str[64];
	format(str, 64, "You have created vehicle with ID: %d.", id);
	SendClientMessage(playerid, -1, str);
	return 1;
}

CMD:opendoor(playerid, params[])
{
	if(isnull(params)) 
	{
		SendClientMessage(playerid, -1, "USAGE: /opendoor [param]");
		SendClientMessage(playerid, -1, "Params: FL - front left door, FR - front right door");
		SendClientMessage(playerid, -1, "Params: BL - back left door,  BR - back right door");
		return 1;
	}
	new vehicleid = GetPlayerVehicleID(playerid);
	if(vehicleid == 0) return SendClientMessage(playerid, -1, "You have to be in vehicle.");

	if(!strcmp(params, "FL", true))
	{
		//if(IsVehicleDoorOpened(vehicleid, FL_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already opened.");
		OpenVehicleDoor(vehicleid, FL_DOOR);
	}
	else if(!strcmp(params, "FR", true))
	{
		//if(IsVehicleDoorOpened(vehicleid, FR_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already opened.");
		OpenVehicleDoor(vehicleid, FR_DOOR);
	}
	else if(!strcmp(params, "BL", true))
	{
		//if(IsVehicleDoorOpened(vehicleid, BL_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already opened.");
		OpenVehicleDoor(vehicleid, BL_DOOR);
	}
	else if(!strcmp(params, "BR", true))
	{
		//if(IsVehicleDoorOpened(vehicleid, BR_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already opened.");
		OpenVehicleDoor(vehicleid, BR_DOOR);
	}
	else return 1;
	SendClientMessage(playerid, -1, "The door is opened.");
	return 1;
}
CMD:closedoor(playerid, params[])
{
	if(isnull(params)) 
	{
		SendClientMessage(playerid, -1, "USAGE: /closedoor [param]");
		SendClientMessage(playerid, -1, "Params: FL - front left door, FR - front right door");
		SendClientMessage(playerid, -1, "Params: BL - back left door,  BR - back right door");
		return 1;
	}
	new vehicleid = GetPlayerVehicleID(playerid);
	if(vehicleid == 0) return SendClientMessage(playerid, -1, "You have to be in vehicle.");

	if(!strcmp(params, "FL", true))
	{
		//if(IsVehicleDoorClosed(vehicleid, FL_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already closed.");
		CloseVehicleDoor(vehicleid, FL_DOOR);
	}
	else if(!strcmp(params, "FR", true))
	{
		//if(IsVehicleDoorClosed(vehicleid, FR_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already closed.");
		CloseVehicleDoor(vehicleid, FR_DOOR);
	}
	else if(!strcmp(params, "BL", true))
	{
		//if(IsVehicleDoorClosed(vehicleid, BL_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already closed.");
		CloseVehicleDoor(vehicleid, BL_DOOR);
	}
	else if(!strcmp(params, "BR", true))
	{
		//if(IsVehicleDoorClosed(vehicleid, BR_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already closed.");
		CloseVehicleDoor(vehicleid, BR_DOOR);
	}
	SendClientMessage(playerid, -1, "The door is closed.");
	return 1;
}

CMD:setsiren(playerid, params[])
{
	new vehid, newstate;
	if(sscanf(params, "ii", vehid, newstate)) return SendClientMessage(playerid, -1, "USAGE:/setsiren [vehicle ID] [state (0 - remove/1 - install)]");
	
	//SetVehicleSirenState(vehid, newstate == 0 ? WDS_SIREN_STATE_NOT_INSTALLED : WDS_SIREN_STATE_OFF);
	
	if(newstate == 0)
		UninstallVehicleSiren(vehid);
	else 
		InstallVehicleSiren(vehid);

	SendClientMessage(playerid, -1, "You have set vehicle's siren state.");	
	return 1;
}
CMD:openwindow(playerid, params[])
{
	if(isnull(params)) 
	{
		SendClientMessage(playerid, -1, "USAGE: /openwindow [param]");
		SendClientMessage(playerid, -1, "Params: FL - front left door, FR - front right door");
		SendClientMessage(playerid, -1, "Params: BL - back left door,  BR - back right door");
		return 1;
	}
	new vehicleid = GetPlayerVehicleID(playerid);
	if(vehicleid == 0) return SendClientMessage(playerid, -1, "You have to be in vehicle.");

	if(!strcmp(params, "FL", true))
	{
		if(IsVehicleWindowOpened(vehicleid, FL_DOOR)) return SendClientMessage(playerid, -1, "Error: window is already opened.");
		OpenVehicleWindow(vehicleid, FL_DOOR);
	}
	else if(!strcmp(params, "FR", true))
	{
		if(IsVehicleWindowOpened(vehicleid, FR_DOOR)) return SendClientMessage(playerid, -1, "Error: window is already opened.");
		OpenVehicleWindow(vehicleid, FR_DOOR);
	}
	else if(!strcmp(params, "BL", true))
	{
		if(IsVehicleWindowOpened(vehicleid, BL_DOOR)) return SendClientMessage(playerid, -1, "Error: window is already opened.");
		OpenVehicleWindow(vehicleid, BL_DOOR);
	}
	else if(!strcmp(params, "BR", true))
	{
		if(IsVehicleWindowOpened(vehicleid, BR_DOOR)) return SendClientMessage(playerid, -1, "Error: window is already opened.");
		OpenVehicleWindow(vehicleid, BR_DOOR);
	}
	SendClientMessage(playerid, -1, "The window is opened.");
	return 1;
}

CMD:closewindow(playerid, params[])
{
	if(isnull(params)) 
	{
		SendClientMessage(playerid, -1, "USAGE: /closewindow [param]");
		SendClientMessage(playerid, -1, "Params: FL - front left door, FR - front right door");
		SendClientMessage(playerid, -1, "Params: BL - back left door,  BR - back right door");
		return 1;
	}
	new vehicleid = GetPlayerVehicleID(playerid);
	if(vehicleid == 0) return SendClientMessage(playerid, -1, "You have to be in vehicle.");

	if(!strcmp(params, "FL", true))
	{
		if(IsVehicleWindowClosed(vehicleid, FL_DOOR)) return SendClientMessage(playerid, -1, "Error: window is already closed.");
		CloseVehicleWindow(vehicleid, FL_DOOR);
	}
	else if(!strcmp(params, "FR", true))
	{
		if(IsVehicleWindowClosed(vehicleid, FR_DOOR)) return SendClientMessage(playerid, -1, "Error: window is already closed.");
		CloseVehicleWindow(vehicleid, FR_DOOR);
	}
	else if(!strcmp(params, "BL", true))
	{
		if(IsVehicleWindowClosed(vehicleid, BL_DOOR)) return SendClientMessage(playerid, -1, "Error: window is already closed.");
		CloseVehicleWindow(vehicleid, BL_DOOR);
	}
	else if(!strcmp(params, "BR", true))
	{
		if(IsVehicleWindowClosed(vehicleid, BR_DOOR)) return SendClientMessage(playerid, -1, "Error: window is already closed.");
		CloseVehicleWindow(vehicleid, BR_DOOR);
	}
	SendClientMessage(playerid, -1, "The window is closed.");
	return 1;
}