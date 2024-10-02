SELECT 
  wand.id, 
  wandP.age, 
  wand.coins_needed, 
  wand.power 
FROM 
  Wands wand 
  JOIN Wands_Property wandP ON wand.code = wandP.code 
WHERE 
  is_evil = 0 
  AND coins_needed = (
    SELECT 
      MIN(w.coins_needed) 
    FROM 
      Wands as w 
      JOIN Wands_Property as wp ON w.code = wp.code 
    WHERE 
      w.power = wand.power 
      AND wp.age = wandP.age
  ) 
ORDER BY 
  wand.power DESC, 
  wandP.age DESC;
