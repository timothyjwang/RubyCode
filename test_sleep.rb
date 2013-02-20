def test_sleep
	puts "You should see this message instantaneously; but the next one should..."
	sleep(5)
	puts "...appear after about 5 seconds."
end

test_sleep
