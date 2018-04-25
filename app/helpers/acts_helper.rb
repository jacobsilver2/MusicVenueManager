module ActsHelper
  
  def headliner?(act)
    if ActShow.find(act.id).headliner
      "Yes"
    else
      "No"
    end
  end
end
