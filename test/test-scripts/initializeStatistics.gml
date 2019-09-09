///initializeStatistics()

var statistics = ds_map_logcreate();
statistics[? 'maxDepth'] = 0;
statistics[? 'maxCrew'] = 0;
statistics[? 'maxCapital'] = 0;
statistics[? 'moneyEarned'] = 0;
statistics[? 'stationLevelReached'] = 0;
statistics[? 'emmetsLost'] = 0;
statistics[? 'emmetsBought'] = 0;
statistics[? 'emmetsTrained'] = 0;
statistics[? 'buildingsBought'] = 0;
statistics[? 'moneySpentOnBuildings'] = 0;
statistics[? 'moneySpentOnTrainings'] = 0;
statistics[? 'moneySpentOnUpgrades'] = 0;
statistics[? 'moneySpentOnHealing'] = 0;
statistics[? 'moneySpentOnNaming'] = 0;
statistics[? 'moneySpent'] = 0;
statistics[? 'iceWorlds'] = 0;
statistics[? 'lavaWorlds'] = 0;
statistics[? 'dirtWorlds'] = 0;
statistics[? 'wallsDrilled'] = 0;
statistics[? 'wallsDynamited'] = 0;
statistics[? 'gravelCleared'] = 0;
statistics[? 'pathwaysBuilt'] = 0;
statistics[? 'buildingsProduced'] = 0;
statistics[? 'buildingsLost'] = 0;
statistics[? 'materialsRefined'] = 0;
statistics[? 'cavesExplored'] = 0;


object_game.statistics = statistics;
