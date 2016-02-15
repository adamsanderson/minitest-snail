Minitest Snail
======================

Prints a list of tests that take too long.

Installation
------------

    gem install minitest-snail
    
Usage
-----

Minitest Snail can be enabled from the command line using the `max-duration` parameter:

    ruby test/example_test.rb --max-duration 2
    
This would print out a list of any tests taking longer than 2 seconds to run:

    # Running:

    ....

    Finished in 5.001143s

    4 runs, 7 assertions, 0 failures, 0 errors, 0 skips

    2 slow tests.
      0) ExampleTest#test_alpha: 2.30 s
      1) ExampleTest#test_beta: 2.11 s

If you don't run your tests directly, you can programmatically enable Minitest Snail:
    
    Minitest::SnailReporter.enable!

You can also configure it using `enable!`:

    Minitest::SnailReporter.enable! :max_duration => 2.5
    
If you are using Rails, your `test/test_helper.rb` file is good place to do this initialization.

Authors 
-------

[Adam Sanderson](netghost@gmail.com) (http://monkeyandcrow.com)
