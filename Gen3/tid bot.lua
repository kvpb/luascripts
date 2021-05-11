-- Do note this has a tendency to flash the screen like crazy
-- Be careful if flashing screens is an issue for you

desiredTarget=01373
--desiredTarget=00001 -- 14637 00001 RED,   Timid Shiny 70-power Hidden Power 31         xtendsto0 31         31 31 31 Mewtwo
--desiredTarget=1     -- 14637 00001 RED,   Timid Shiny 70-power Hidden Power 31         xtendsto0 31         31 31 31 Mewtwo
--desiredTarget=00004 -- 51537 00004 BRICE, Hasty Shiny 70-power Hidden Power 31         31        xtendsto31 31 31 31 Rayquaza
--desiredTarget=4     -- 11873 00004 BRICE, Naive Shiny 70-power Hidden Power xtendsto31 31        31         31 31 31 Deoxys

initialState=savestate.create()
savestate.save(initialState)

while desiredTarget~=actualTarget do
	savestate.load(initialState)
	emu.frameadvance()
	savestate.save(initialState)

	joypad.set(1,{A=true})
	a=0
	while a < 30 do
		emu.frameadvance()
		a=a+1
	end
  
	actualTarget=memory.readwordunsigned(0x02020000)
	if desiredTarget==actualTarget then
		emu.pause()
	end
end
