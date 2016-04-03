function tasklist_widget(s)
   local widget = {}

   widget.buttons = awful.util.table.join(
      awful.button(
	 { },
	 1,
	 function (c)
	    if c == client.focus then
	       c.minimized = true
	    else
	       c.minimized = false
	       if not c:isvisible() then
		  awful.tag.viewonly(c:tags()[1])
	       end
	       client.focus = c
	       c:raise()
	    end
	 end
      ),
      awful.button(
	 { },
	 3,
	 function ()
	    if instance then
	       instance:hide()
	       instance = nil
	    else
	       instance = awful.menu.clients(
		  {
		     theme = { width = 250 }
		  }
	       )
	    end
	 end
      ),
      awful.button(
	 { },
	 4,
	 function ()
	    awful.client.focus.byidx(1)
	    if client.focus then
	       client.focus:raise()
	    end
	 end
      ),
      awful.button(
	 { },
	 5,
	 function ()
	    awful.client.focus.byidx(-1)
	    if client.focus then
	       client.focus:raise()
	    end
	 end
      )
   )

   return awful.widget.tasklist(
      s,
      awful.widget.tasklist.filter.currenttags,
      widget.buttons
   )
end
