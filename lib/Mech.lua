function item_collision(itema, itemb)	
	return  itema.x < itemb.x + itemb.w 
		and itemb.x < itema.x + itema.w
		and itema.y < itemb.y + itemb.h
		and itemb.y < itema.y + itema.h
end

function mouse_collision(item)
	local x, y = lm.getPosition()

	return  x > item.x
		and x < item.x + item.w * SCALE
		and y > item.y
		and y < item.y + item.h * SCALE
end

function char_collision(char)
	local x = char.x + char.w / 2
	local y = char.y + char.h

	return y > 50  * SCALE + x / 3 and
		   y < 150 * SCALE + x / 3 and
		   y > 150 * SCALE - x / 3 and
		   y < 250 * SCALE - x / 3
end

function shiftScene(nextScene)
	curtain_start = true
	next_scene = nextScene
end

function updateCurtain(dt)
	if not curtain_start then
		return
	end

	if curtain_darken then
		if curtain_alpha > 1 then
			curtain_alpha = curtain_alpha - dt * 1000
		else
			SCENE = next_scene
			curtain_darken = false
		end
	else
		if curtain_alpha < 255 then
			curtain_alpha = curtain_alpha + dt * 1000
		else
			curtain_darken = true
			curtain_start  = false
		end
	end
end

function drawCurtain()
	lg.setColor(255, 255, 255, 255 - curtain_alpha);
	lg.draw(curtain, 0, 0, 0, SCALE);
	lg.setColor(255, 255, 255, 255);
end

function anim(img)
	img.anim:draw(img.x * SCALE, img.y * SCALE, 0, SCALE)
end

function animUpdate(img, dt)
	img.anim:update(dt)
end

function getTalk(id, number)
	local count = 0
	local list  = {}

	for line in lf.lines("txt/" .. id .. ".txt") do
		if line == "iva" or line == "sercan" then
			list[count] = {}
			list[count].owner = line
		elseif line ~= "-" then
			list[count].txt   = line
			count = count + 1
		end
	end

	return list
end