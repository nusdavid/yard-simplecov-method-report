yard-simplecov-method-report
==================

YARD plugin to report the percentage of coverage for each class and instance method tested or spec'd. 

--

  yardoc --plugin yard-simplecov-method-report lib spec 

or add the line

  --plugin yard-simplecov-method-report

to your +.yardopts+ file

If you would like to have this plugin loaded by default add the lines below to your _~/.yard/config_ file.

    # Load yard-simplecov-method-report
    autoload_plugins:
      - yard-simplecov-method-report

---

This gem should be signed. See https://www.rubygems-openpgp-ca.org/ for more information
