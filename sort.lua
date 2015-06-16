term.clear()
term.setCursorPos(1,1)
print("Starting to sort...")

function scrollinv ()
  if turtle.getSelectedSlot() == 16 then
    next = 1
  else
    next = turtle.getSelectedSlot()+1
  end
  turtle.select(next)
end

function drop ()
  turtle.drop(64)
  print("Dropped Item")
end
function remove ()
  turtle.dropDown(64)
  print("Removed item")
end
function keep ()
  turtle.dropUp(64)
end

function main ()
  scrollinv()  

  local item = turtle.getItemDetail(turtle.getSelectedSlot())

  if item then
    print("Item name: ", item.name)
    print("Item damage value: ", item.damage)
    print("Item count: ", item.count)
    if item.name == "minecraft:cobblestone" then remove()
    elseif item.name == "chisel:limestone" then remove()
    elseif item.name == "chisel:diorite" then remove()
    elseif item.name == "chisel:andesite" then remove()
    elseif item.name == "chisel:granite" then remove()
    else keep()
    end
  else
    print("Loading fresh items")
    turtle.suck(64)
    main()
  end
  sleep(0.01)
end

while true do
  main()
end

print("Program killed the main loop. Exiting...")