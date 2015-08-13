
class DesignationParser
  def initialize
    @pattern = /([A-Za-z0-9]{2,5})[-+ _.]{0,5}([A-Za-z0-9]{2,6})/
  end
  def get_all_matched(content)
    content.scan(@pattern).map do |match_arr|
      match_arr[0].upcase + '-' + match_arr[1].upcase
    end
  end
end