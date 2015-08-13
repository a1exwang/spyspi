
class DesignationParser
  def initialize(type = 1)
    case type
      when 1
        @pattern = /([A-Za-z0-9]{2,5})[-+ _.]{0,5}([A-Za-z0-9]{2,6})/
      when 2
        @pattern = /([A-Za-z]{2,5})[-+ _.]{0,5}([0-9]{2,6})/
    end
  end
  def get_all_matched(content)
    content.scan(@pattern).map do |match_arr|
      des_main = match_arr[0].upcase
      des_add = match_arr[1].upcase
      if Series.where('upper(name) = ?', des_main.upcase).count > 0
        [des_main, des_add]
      else
        nil
      end
    end.reduce([]) do |sum, item|
      sum.push(item) if item
      sum
    end
  end
end