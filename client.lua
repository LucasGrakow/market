
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface("grk_garages",src)
vSERVER = Tunnel.getInterface("grk_garages")

-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do 
		local delay = 500
		for k,v in pairs(Config.market) do
			local distance = #(GetEntityCoords(PlayerPedId()) - vector3(v.coords[1],v.coords[2],v.coords[3]))
			if distance <= 10.0 then
				delay = 1
				DrawMarker(20,v.coords[1],v.coords[2],v.coords[3]-0.3,0,0,0,0.0,0,0,0.5,0.5,0.5,255,195,0,150,1,0,0,1)
				if distance <= 1.3 then
					if IsControlJustPressed(0,38) then
						local itemTable = {}
						for k2,v2 in pairs(v.items) do
							table.insert(itemTable,{ image = v2.image, item = v2.item, name = v2.name, price = v2.price })
						end
						SetNuiFocus(true,true)
						SendNUIMessage({ 
							isVisible = true,
							ItemList = itemTable,
							market = {name = v.marketName}
						})
					end
				end
			end
		end
		Wait(delay)
	end
end)

RegisterNUICallback("hideMenu",function(data,cb)
	TriggerEvent('hideNui')
end)

RegisterNetEvent('hideNui')
AddEventHandler('hideNui', function()
	SetNuiFocus(false)
	SendNUIMessage({ 
		isVisible = false,
	})
end)

RegisterNUICallback("buyItem",function(data,cb)
	if data.amount > 0 then
		vSERVER.buyItem(data.item,data.price, data.amount)
		TriggerEvent('hideNui')
	end
end)

