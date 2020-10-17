window.addEventListener('load', function(){
  let price =  document.getElementById("item-price")
  let tax =  document.getElementById("add-tax-price")
  let profit =  document.getElementById("profit") 
  price.addEventListener('input', function(){
    let inputprice = document.getElementById("item-price").value
      tax.innerHTML = Math.floor( inputprice / 10 )
      profit.innerHTML = Math.floor( inputprice - tax.innerHTML )
    })
})
