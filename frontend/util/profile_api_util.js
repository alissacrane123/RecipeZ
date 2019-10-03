export const fetchPlan = () => {
  // debugger
  return $.ajax({
    method: 'GET',
    url: '/api/weekly_plans/current'
  })
}

export const fetchPlans = () => {

  return $.ajax({
    method: 'GET',
    url: '/api/weekly_plans'
  })
}