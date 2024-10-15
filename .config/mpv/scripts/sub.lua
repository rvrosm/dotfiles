mp.add_hook('on_load', 10, function ()
    mp.set_property('sub-file-paths', 'sub:subtitle:Sub:Subtitle:subs:subtitles:Subs:Subtitles:Subs/' .. mp.get_property('filename/no-ext'))
end)
