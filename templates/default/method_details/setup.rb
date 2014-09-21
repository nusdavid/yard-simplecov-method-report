def init
  super
  sections.last.place(:coverage).before(:source)
end
