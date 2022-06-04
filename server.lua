-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("grk_garages",src)
vCLIENT = Tunnel.getInterface("grk_garages")

-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

function src.buyItem(item,price,amount)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.tryFullPayment(user_id,price*amount) then 
        vRP.giveInventoryItem(user_id,item,amount)
    else
        TriggerClientEvent("Notify",source,"negado","Negado","Dinheiro insuficiente.", 8000)
    end
end