Debug = {};
Debug.metatable = {};
Debug.metatable.__index = Debug;

function Debug:print_r ( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end

function Debug:getMousePoint(view)
    view:addEventListener('touch', function(event)
        if event.phase == 'began' then
            print(table.concat({'Touch coordinates: ', event.x, ', ', event.y}, ''));
        end
    end);
end

function Debug:getMask()
    local debugRect = display.newRect(0, 0, display.contentWidth, display.contentHeight);
    debugRect.x = debugRect.width/2;
    debugRect.y = debugRect.height/2;
    debugRect.alpha = 0.1;

    return debugRect;
end

return Debug;