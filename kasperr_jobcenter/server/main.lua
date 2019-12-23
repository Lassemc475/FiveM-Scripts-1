--[[
  __  __           _            _                 _  __                         _____
 |  \/  |         | |          | |               | |/ /                        |  __ \
 | \  / | __ _  __| | ___      | |__  _   _      | ' / __ _ ___ _ __   ___ _ __| |__) |
 | |\/| |/ _` |/ _` |/ _ \     | '_ \| | | |     |  < / _` / __| '_ \ / _ \ '__|  _  /
 | |  | | (_| | (_| |  __/     | |_) | |_| |     | . \ (_| \__ \ |_) |  __/ |  | | \ \
 |_|  |_|\__,_|\__,_|\___|     |_.__/ \__, |     |_|\_\__,_|___/ .__/ \___|_|  |_|  \_\
                                       __/ |                   | |
                                      |___/                    |_|

  Author: Kasper Rasmussen
  Steam: https://steamcommunity.com/id/kasperrasmussen
]]

local blacklist = {"staff", "ejer", "admin"}
local blacklisted = false

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "kasperr_jobcenter")

RegisterServerEvent("kasperr_jobcenter:selectJob")
AddEventHandler("kasperr_jobcenter:selectJob", function(group)

  for k,v in pairs(blacklist) do
    if (group == v) then
    -- body...
    blacklisted = true
    end
  end
  if blacklisted = false then
    local user_id = vRP.getUserId({source})
    vRP.addUserGroup({user_id,group})
    print("Ikke bugger")
    TriggerClientEvent("kasperr_jobcenter:notification", source, Config.Language.SelectedJob .. " " .. group)
  else
    print("Bugger")
    TriggerClientEvent("kasperr_jobcenter:notification", source, "Nej. Stop med det der")
  end
end)
