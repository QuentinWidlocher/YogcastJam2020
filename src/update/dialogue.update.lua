--ran out of time!

function update_dialogue()
    if #dialogueQueue > 0 and curLine.text == nil then
        curLine = {text = dialogueQueue[1], counter = 0}
    end
    
    drawLines = {}
    nextLine = ""
    
    --Iterating through all characters in curLine
    for i = 1, curLine.counter do
        local curChar = sub(curLine.text, i, i)
        nextLine = nextLine .. curChar
        --When the end of the line is reached:
        if #nextLine * 4 == SCREEN_SIZE - dPadding * 2 then
            if #drawLines < dMaxLines then
                --Find the start of the current word and send it to the next line
                for j = #nextLine, 0, -1 do
                    if sub(nextLine, j, j) == " " then
                        --Add the line up to the current word to drawLines and start a new newLine with the current word
                        add(drawLines, sub(nextLine, 1, j))
                        nextLine = sub(nextLine, j + 1)
                    end
                end
            else
                dWaiting = true
            end
        end
    end
    if #drawLines < dMaxLines then add(drawLines, nextLine) end

    if curLine.counter == #curLine.text then dWaiting = true end

    if not dWaiting then
        curLine.counter += 1
    end

    if dWaiting and (btnp(GAMEPAD.X) or btnp(GAMEPAD.O)) then
        dWaiting = false
        --Empty drawLines and update curLine to match the point the text is at
        for k,v in pairs(drawLines) do
            curLine.text = sub(curLine.text, #v)
            if #curLine.text == 1 then curLine.text = "" end
            curLine.counter -= #v
            drawLines[k] = nil
        end
        if curLine.counter == #curLine.text then
            curLine = {}
            dialogueQueue[1] = nil
        end
    end
end

function add_dialogue(text)
    add(dialogueQueue, text)
end