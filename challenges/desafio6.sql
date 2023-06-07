SELECT
  MIN(price_plan) AS faturamento_minimo,
  MAX(price_plan) AS faturamento_maximo,
  ROUND(AVG(price_plan), 2) AS faturamento_medio,
  SUM(price_plan) AS faturamento_total
FROM SpotifyClone.plans_user AS plan
INNER JOIN SpotifyClone.users AS user ON plan.plan_id = user.plan_id;