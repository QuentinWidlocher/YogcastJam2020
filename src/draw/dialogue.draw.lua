function draw_dialogue()
    cls()
    print("counter: " .. curLine.counter .. " #letters: " .. #curLine.text)
    for _,line in pairs(drawLines) do
        print(line)
    end
end