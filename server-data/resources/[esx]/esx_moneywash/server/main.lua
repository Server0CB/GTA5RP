local PlayersWashing = {}

local function WashMoney(source)

	SetTimeout(10000, function()

		if PlayersWashing[source] == true then

			TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)

				local blackMoney = xPlayer:getAccount('black_money').money

				if blackMoney < Config.Slice then
					TriggerClientEvent('esx_moneywash:showNotification', source, 'Vous n\'avez pas assez d\'argent à blanchir, minimum : $' .. Config.Slice)
				else
					
					local washedMoney = math.floor(Config.Slice / 100 * Config.Percentage)

					xPlayer:removeAccountMoney('black_money', Config.Slice)
					xPlayer:addMoney(washedMoney)

					WashMoney(source)
				end

			end)
		end
	end)
end

RegisterServerEvent('esx_moneywash:startWash')
AddEventHandler('esx_moneywash:startWash', function()
	PlayersWashing[source] = true
	TriggerClientEvent('esx_moneywash:showNotification', source, 'Blanchiement en cours...')
	WashMoney(source)
end)

RegisterServerEvent('esx_moneywash:stopWash')
AddEventHandler('esx_moneywash:stopWash', function()
	PlayersWashing[source] = false
end)
